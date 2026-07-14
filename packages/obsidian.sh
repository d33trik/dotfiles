if [ ! -x /opt/obsidian/Obsidian.AppImage ]; then
  OBSIDIAN_DIR="/opt/obsidian"
  DESKTOP_FILE="$HOME/.local/share/applications/obsidian.desktop"
  ICON_DIR="$HOME/.local/share/icons"
  ICON_PATH="$ICON_DIR/obsidian.png"

  sudo mkdir -p "$OBSIDIAN_DIR"

  DOWNLOAD_URL=$(curl -fsSL https://api.github.com/repos/obsidianmd/obsidian-releases/releases/latest \
    | grep -oP '"browser_download_url":\s*"\K[^"]*\.AppImage(?=")' \
    | grep -v arm64)

  sudo curl -fsSL -o "$OBSIDIAN_DIR/Obsidian.AppImage" "$DOWNLOAD_URL"

  sudo chmod +x "$OBSIDIAN_DIR/Obsidian.AppImage"

  tmpdir=$(mktemp -d)
  trap 'rm -rf "$tmpdir"' EXIT

  cd "$tmpdir"
  "$OBSIDIAN_DIR/Obsidian.AppImage" --appimage-extract >/dev/null 2>&1 || true

  sudo mkdir -p "$ICON_DIR"
  sudo cp "$tmpdir/squashfs-root/usr/share/icons/hicolor/512x512/apps/obsidian.png" "$ICON_PATH"
  sudo chmod 644 "$ICON_PATH"

  sudo mkdir -p "$(dirname "$DESKTOP_FILE")"
  sudo tee "$DESKTOP_FILE" >/dev/null <<EOF
[Desktop Entry]
Name=Obsidian
Exec=$OBSIDIAN_DIR/Obsidian.AppImage --no-sandbox %U
Icon=$ICON_PATH
Type=Application
Categories=Office;Utility;
MimeType=x-scheme-handler/obsidian;
StartupWMClass=obsidian
EOF

  sudo chmod 644 "$DESKTOP_FILE"

  update-desktop-database "$HOME/.local/share/applications" 2>/dev/null || true
fi

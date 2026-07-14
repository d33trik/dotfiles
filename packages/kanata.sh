if ! command -v kanata &>/dev/null; then
  cargo install --locked kanata

  sudo install -Dm755 "$HOME/.cargo/bin/kanata" /usr/local/bin/kanata

  sudo groupadd --system uinput 2>/dev/null || true

  sudo usermod -aG input "$USER"
  sudo usermod -aG uinput "$USER"

  sudo modprobe uinput

  sudo tee /etc/modules-load.d/uinput.conf >/dev/null <<EOF
uinput
EOF

  sudo tee /etc/udev/rules.d/99-input.rules >/dev/null <<'EOF'
KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"
EOF

  sudo udevadm control --reload-rules
  sudo udevadm trigger

  sudo tee /etc/systemd/system/kanata.service >/dev/null <<EOF
[Unit]
Description=Kanata keyboard remapper
Documentation=https://github.com/jtroo/kanata
After=systemd-udevd.service

[Service]
Environment=PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin
CPUSchedulingPolicy=rr
CPUSchedulingPriority=99
IOSchedulingClass=realtime
Nice=-20
Type=simple
ExecStart=/usr/local/bin/kanata --cfg $HOME/.config/kanata/config.kbd --no-wait
Restart=on-failure
RestartSec=3

[Install]
WantedBy=multi-user.target
EOF

  sudo tee /etc/sudoers.d/kanata >/dev/null <<EOF
$USER ALL=(ALL) NOPASSWD: /usr/bin/systemctl restart kanata
EOF

  sudo systemctl daemon-reload
  sudo systemctl enable --now kanata
fi

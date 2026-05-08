yay -S --noconfirm --needed --provides=false kanata

sudo groupdel uinput 2>/dev/null
sudo groupadd --system uinput

sudo usermod -aG input $USER
sudo usermod -aG uinput $USER

sudo modprobe uinput

sudo tee /etc/udev/rules.d/99-input.rules >/dev/null <<EOF
KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"
EOF

sudo udevadm control --reload-rules && sudo udevadm trigger

USER_HOME="$HOME"
KANATA_BIN="$(command -v kanata)"

sudo tee /etc/systemd/system/kanata.service >/dev/null <<EOF
[Unit]
Description=Kanata keyboard remapper
Documentation=https://github.com/jtroo/kanata

[Service]
Environment=PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin
CPUSchedulingPolicy=rr
CPUSchedulingPriority=99
IOSchedulingClass=realtime
Nice=-20
Type=simple
ExecStart=${KANATA_BIN} --cfg ${USER_HOME}/.config/kanata/config.kbd --no-wait
Restart=on-failure
RestartSec=3

[Install]
WantedBy=default.target
EOF

sudo systemctl daemon-reload
sudo systemctl enable kanata
sudo systemctl start kanata

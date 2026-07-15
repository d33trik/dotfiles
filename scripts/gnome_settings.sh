#!/bin/bash

# e - script stops on error
# u - error if undefined variable
# o pipefail - script fails if command piped fails
set -euo pipefail

set_keyboard() {
	gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us+intl')]"
	gsettings set org.gnome.desktop.input-sources per-window false
	gsettings set org.gnome.desktop.input-sources xkb-options "[]"
	echo "Keyboard settings configured."
}

set_power() {
	gsettings set org.gnome.settings-daemon.plugins.power power-button-action 'suspend'
	gsettings set org.gnome.desktop.interface show-battery-percentage false
	gsettings set org.gnome.settings-daemon.plugins.power power-saver-profile-on-low-battery true
	gsettings set org.gnome.desktop.session idle-delay 300
	gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-type 'suspend'
	gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-timeout 900
	gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'suspend'
	gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-timeout 900
	sudo tuned-adm profile throughput-performance
	echo "Power settings configured."
}

set_multitasking() {
	gsettings set org.gnome.desktop.interface enable-hot-corners true
	gsettings set org.gnome.mutter edge-tiling false
	gsettings set org.gnome.mutter dynamic-workspaces false
	gsettings set org.gnome.desktop.wm.preferences num-workspaces 10
	gsettings set org.gnome.mutter workspaces-only-on-primary true
	gsettings set org.gnome.shell.app-switcher current-workspace-only true
	echo "Multitasking settings configured."
}

set_appearance() {
	gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
	gsettings set org.gnome.desktop.interface accent-color 'blue'
	local wallpaper="file://$HOME/pictures/wallpapers/3uq3R57dxqw8mF4.jpg"
	gsettings set org.gnome.desktop.background picture-uri "$wallpaper"
	gsettings set org.gnome.desktop.background picture-uri-dark "$wallpaper"
	gsettings set org.gnome.desktop.interface cursor-theme 'BreezeX-RosePine-Linux'
	echo "Appearance settings configured."
}

set_search() {
	gsettings set org.gnome.desktop.search-providers disabled \
		"['org.gnome.Boxes.desktop', 'org.gnome.Calendar.desktop', 'org.gnome.Calculator.desktop', 'org.gnome.Characters.desktop', 'org.gnome.clocks.desktop', 'org.gnome.Contacts.desktop', 'org.gnome.Nautilus.desktop', 'org.gnome.Settings.desktop', 'org.gnome.Software.desktop', 'org.gnome.Weather.desktop', 'org.mozilla.firefox.desktop']"
	gsettings set org.gnome.desktop.search-providers enabled "[]"
	gsettings set org.gnome.desktop.search-providers sort-order "[]"
	echo "Search settings configured."
}

set_mouse() {
	gsettings set org.gnome.desktop.peripherals.mouse left-handed false
	gsettings set org.gnome.desktop.peripherals.mouse speed 0.7
	gsettings set org.gnome.desktop.peripherals.mouse accel-profile 'default'
	gsettings set org.gnome.desktop.peripherals.mouse natural-scroll false
	echo "Mouse settings configured."
}

set_shortcuts() {
	local ws
	for ws in {1..9}; do
		gsettings set org.gnome.desktop.wm.keybindings "move-to-workspace-${ws}" "['<Super><Shift>${ws}']"
		gsettings set org.gnome.desktop.wm.keybindings "switch-to-workspace-${ws}" "['<Super>${ws}']"
		gsettings set org.gnome.shell.keybindings "switch-to-application-${ws}" "[]"
	done
	gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-10 "['<Super><Shift>0']"
	gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-10 "['<Super>0']"
	gsettings set org.gnome.settings-daemon.plugins.media-keys screensaver "['<Ctrl>l']"
	gsettings set org.gnome.desktop.wm.keybindings close "['<Super><Shift>q']"
	gsettings set org.gnome.desktop.wm.keybindings minimize "[]"
	echo "Shortcuts configured."
}

set_custom_shortcuts() {
	local path="/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
	gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['${path}']"
	gsettings set "org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:${path}" name 'Alacritty'
	gsettings set "org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:${path}" command 'alacritty'
	gsettings set "org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:${path}" binding '<Super>Return'
	echo "Custom shortcuts configured."
}

main() {
	set_keyboard
	set_power
	set_multitasking
	set_appearance
	set_search
	set_mouse
	set_shortcuts
	set_custom_shortcuts
	echo "GNOME settings configured."
}

main "$@"

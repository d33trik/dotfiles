#######################
# Display Configuration
#######################

# Sets up NVIDIA as the rendering provider for the X server
xrandr --setprovideroutputsource modesetting NVIDIA-0

# Automatically configure the display outputs
xrandr --auto

#######################
# Keyboard Settings
#######################

# Set the keyboard layout to US
setxkbmap us

# Remap Caps Lock to function as a Control key when held
setxkbmap -option 'caps:ctrl_modifier'

# Make Caps Lock function as Escape when tapped
xcape -e 'Caps_Lock=Escape'

# Set right Control key as Compose key
setxkbmap -option compose:rctrl

#######################
# X Resources
#######################

# Load X resources configuration
xrdb -merge ~/.config/X11/Xresources

#######################
# Window Manager
#######################

# Start the i3 window manager
# This should be the last line as it replaces the current process
exec i3

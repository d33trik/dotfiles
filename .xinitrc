# Sets up NVIDIA as the rendering provider for the X server
xrandr --setprovideroutputsource modesetting NVIDIA-0

# Automatically configure the display outputs
xrandr --auto

# Load X resources configuration
xrdb -merge ~/.config/X11/Xresources

# Start the i3 window manager
# This should be the last line as it replaces the current process
exec i3

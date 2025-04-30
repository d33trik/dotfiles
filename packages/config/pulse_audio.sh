sudo gpasswd -a $(whoami) audio
sudo gpasswd -a $(whoami) lp

sudo rm -f /etc/pulse/default.pa.d/noise-cancellation.pa
echo '### Enable Echo/Noise-Cancellation
load-module module-echo-cancel use_master_format=1 aec_method=webrtc aec_args="analog_gain_control=0 digital_gain_control=1" source_name=echoCancel_source sink_name=echoCancel_sink
set-default-source echoCancel_source
set-default-sink echoCancel_sink' | sudo tee -a /etc/pulse/default.pa.d/noise-cancellation.pa

sudo rm -f /etc/pulse/system.pa.d/bluetooth.pa
echo '### Load Bluetooth Modules
load-module module-bluetooth-policy
load-module module-bluetooth-discover
load-module module-switch-on-connect' | sudo tee -a /etc/pulse/system.pa.d/bluetooth.pa

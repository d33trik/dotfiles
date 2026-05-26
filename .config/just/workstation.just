# Start the default libvirt network and boot the workstation vm
start:
	virsh net-start default
	virsh start workstation

# Shutdown the workstation vm and stop the default libvirt network
shutdown:
	virsh shutdown workstation
	virsh net-destroy default

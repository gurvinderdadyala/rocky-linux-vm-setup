#!/bin/bash

# Configure network settings for the Rocky Linux virtual machines

# Define the names of the VMs
VM_NAMES=("rocky-vm1" "rocky-vm2" "rocky-vm3")

# Configure host-only network
VBoxManage hostonlyif create
VBoxManage hostonlyif ipconfig vboxnet0 --ip 192.168.56.1 --netmask 255.255.255.0

# Set up network for each VM
for VM in "${VM_NAMES[@]}"; do
    VBoxManage modifyvm "$VM" --nic1 hostonly --hostonlyadapter1 vboxnet0
done

echo "Network configuration completed for VMs: ${VM_NAMES[*]}"
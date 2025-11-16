#!/bin/bash

# Define variables
ISO_PATH="/path/to/rocky-linux.iso"  # Update this path to the location of your Rocky Linux ISO
VM_NAMES=("RockyVM1" "RockyVM2" "RockyVM3")
VM_MEMORY="2048"  # Memory in MB
VM_CPUS="2"  # Number of CPUs

# Loop through VM names and create each VM
for VM_NAME in "${VM_NAMES[@]}"; do
    echo "Creating VM: $VM_NAME"
    VBoxManage createvm --name "$VM_NAME" --register
    VBoxManage modifyvm "$VM_NAME" --memory "$VM_MEMORY" --cpus "$VM_CPUS" --nic1 nat
    VBoxManage createhd --filename "$VM_NAME.vdi" --size 20000  # 20 GB
    VBoxManage storagectl "$VM_NAME" --name "SATA Controller" --add sata --controller IntelAhci
    VBoxManage storageattach "$VM_NAME" --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium "$VM_NAME.vdi"
    VBoxManage storageattach "$VM_NAME" --storagectl "SATA Controller" --port 1 --device 0 --type dvddrive --medium "$ISO_PATH"
done

echo "Virtual machines created successfully."
#!/bin/bash

# Define variables
VM_NAME_PREFIX="rocky-vm"
VM_COUNT=3
VM_MEMORY="2048" # Memory in MB
VM_CPUS="2"      # Number of CPUs
ISO_PATH="/path/to/rocky-linux.iso" # Path to the Rocky Linux ISO

# Create VMs
for i in $(seq 1 $VM_COUNT); do
    VM_NAME="${VM_NAME_PREFIX}-${i}"
    
    # Create VM
    VBoxManage createvm --name "$VM_NAME" --register
    
    # Set VM memory and CPUs
    VBoxManage modifyvm "$VM_NAME" --memory $VM_MEMORY --cpus $VM_CPUS
    
    # Set network adapter
    VBoxManage modifyvm "$VM_NAME" --nic1 nat
    VBoxManage modifyvm "$VM_NAME" --nic2 intnet --intnet2 "rocky-net"
    
    # Create a virtual hard disk
    VBoxManage createhd --filename "${VM_NAME}.vdi" --size 20000 # Size in MB
    VBoxManage storagectl "$VM_NAME" --name "SATA Controller" --add sata --controller IntelAhci
    VBoxManage storageattach "$VM_NAME" --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium "${VM_NAME}.vdi"
    
    # Attach the ISO
    VBoxManage storageattach "$VM_NAME" --storagectl "SATA Controller" --port 1 --device 0 --type dvddrive --medium "$ISO_PATH"
    
    echo "Created VM: $VM_NAME"
done

echo "All VMs created successfully."
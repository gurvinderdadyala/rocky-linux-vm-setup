# Setup Instructions for Rocky Linux VM Setup

## Prerequisites
Before you begin, ensure you have the following installed on your host machine:
- VirtualBox (latest version)
- Vagrant (latest version)
- Git (optional, for cloning the repository)

## Cloning the Repository
To get started, clone the repository to your local machine:
```bash
git clone https://github.com/yourusername/rocky-linux-vm-setup.git
cd rocky-linux-vm-setup
```

## Setting Up Virtual Machines

### Step 1: Create Virtual Machines
Run the following script to create three virtual machines using VirtualBox:
```bash
cd scripts
bash create_vms.sh
```
This script will utilize VBoxManage commands to create and configure the VMs.

### Step 2: Configure Network Settings
After the VMs are created, configure their network settings to ensure they can communicate with each other and the host machine:
```bash
bash configure_network.sh
```

### Step 3: Install Rocky Linux
Next, install Rocky Linux on the created virtual machines. This script assumes you have a pre-defined ISO image:
```bash
bash install_rocky_linux.sh
```

## Using Vagrant
Alternatively, you can use Vagrant to manage the virtual machines. To do this, navigate to the Vagrant directory and run:
```bash
cd vagrant
vagrant up
```
This command will read the Vagrantfile and provision the VMs as specified.

## Additional Configuration
After the installation, you may need to perform additional configuration based on your specific requirements. Refer to the individual scripts for more details on customization options.

## Troubleshooting
If you encounter any issues during the setup process, please check the following:
- Ensure that VirtualBox and Vagrant are properly installed and added to your system's PATH.
- Verify that the ISO image for Rocky Linux is accessible and correctly specified in the installation script.

For further assistance, consider checking the official documentation for VirtualBox and Vagrant or reaching out to the community forums.
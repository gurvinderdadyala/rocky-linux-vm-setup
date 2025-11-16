# Rocky Linux VM Setup

This project provides a set of scripts and configurations to automate the setup of three virtual machines running Rocky Linux using VirtualBox and Vagrant.

## Purpose

The primary goal of this project is to simplify the process of creating and configuring multiple Rocky Linux virtual machines for development, testing, or educational purposes.

## Project Structure

- `scripts/`: Contains the shell scripts for creating and configuring the virtual machines.
  - `create_vms.sh`: Automates the creation of three VirtualBox VMs.
  - `configure_network.sh`: Configures network settings for the VMs.
  - `install_rocky_linux.sh`: Installs Rocky Linux on the VMs.

- `vagrant/`: Contains the Vagrantfile for managing the VMs with Vagrant.
  - `Vagrantfile`: Defines VM settings and provisioning.

- `docs/`: Contains documentation for setting up the project.
  - `setup_instructions.md`: Provides detailed setup instructions.

## Usage

1. Ensure you have VirtualBox and Vagrant installed on your machine.
2. Clone this repository to your local machine.
3. Navigate to the `scripts` directory and run `create_vms.sh` to create the virtual machines.
4. Run `configure_network.sh` to set up the network configuration.
5. Execute `install_rocky_linux.sh` to install Rocky Linux on the VMs.
6. For Vagrant users, navigate to the `vagrant` directory and run `vagrant up` to start the VMs.

## Prerequisites

- VirtualBox
- Vagrant
- Access to a Rocky Linux ISO image (if not using a pre-defined one)

## License

This project is licensed under the MIT License. See the LICENSE file for more details.
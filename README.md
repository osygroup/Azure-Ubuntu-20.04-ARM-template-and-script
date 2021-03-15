# Azure-Ubuntu-20.04-ARM-template-and-script

Azure Resource Manager templates (ARM templates) allow you to specify your project's infrastructure in a declarative and reusable way.
This template creates an Ubuntu 20.04 LTS - Gen 1 virtual using Azure-CLI in an interactive Bash shell script. The virtual machine created with this script uses a password for authentication, not SSH key. The Bash script validates the password to meet the password complexity requirement of Azure virtual machines.
The parameters can be edited as variables to suite an organization’s preference.

![](https://github.com/osygroup/Images/blob/main/VM-ARM/1.JPG)

![](https://github.com/osygroup/Images/blob/main/VM-ARM/2.JPG)

![](https://github.com/osygroup/Images/blob/main/VM-ARM/3.JPG)

## Basics
Resource group: <VM_name>
Virtual machine name: <VM_name>
Region: East US
Availability options: Availability zone
Availability zone: 1
Image: Ubuntu Server 20.04 LTS - Gen1
Size: Standard D2s v3 (2 vcpus, 8 GiB memory)
Authentication type: Password
Username: <username>
Public inbound ports: SSH
Azure Spot: No

## Disks
OS disk type: Standard SSD
Use managed disks: Yes
Use ephemeral OS disk: No

## Networking
Network interface: <VM_name>-nic
Public IP: <VM_name>-ip
Virtual network: <VM_name>-vnet
Network security group: <VM_name>-nsg

## Management
Boot diagnostics: On
Enable OS guest diagnostics: Off
Azure Security Center: Basic (free)
System assigned managed identity: Off
Auto-shutdown: Off
Backup: Disabled
Enable hotpatch (Preview): Off
Patch orchestration options: Image Default


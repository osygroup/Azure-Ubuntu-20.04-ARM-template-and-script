#! /bin/sh
read -p "Name of the new Ubuntu 20.04 LTS virtual machine: " vmName
read -p "Username of the new virtual machine  [Linux VM names may only contain letters, numbers, '.', and '-'.]: " username
while true; do
    read -s -p "Password of the new virtual machine  [The value must not be empty. Password must have 3 of the following: 1 lower case character, 1 upper case character, 1 number, and 1 special character. The value must be between 12 and 72 characters long.]: " password
    echo
    read -s -p "Password (again): " password2
    echo
    [ "$password" = "$password2" ] && break
    echo "Passwords do not match. Please try again."
done
az group create --name $vmName --location eastus
az deployment group create --resource-group $vmName --template-file template.json --parameters adminUsername=$username adminPassword=$password 

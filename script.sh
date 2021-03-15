#! /bin/sh
read -p "Name of the new Ubuntu 20.04 LTS virtual machine: " vmName
read -p "Username of the new virtual machine  [Linux VM names may only contain letters, numbers, '.', and '-'.]: " username
while true; do
    read -s -p "Password of the new virtual machine  [The value must not be empty. Password must have the following: 1 lower case character, 1 upper case character and 1 number. The value must be between 6 and 72 characters long.]: " password
    echo
	
	if [[ ${#password} -ge 6 && "$password" == *[[:lower:]]* && "$password" == *[[:upper:]]* && "$password" == *[0-9]* ]]; then
        echo "Password matches the criteria"
    else
        echo "Password criteria: Password should have at least 1 lower case character, 1 upper case character and 1 number."
        echo "Password does not match the criteria, exiting..."
    exit
    fi
	
    read -s -p "Password (again): " password2
    echo
    [ "$password" = "$password2" ] && break
    echo "Passwords do not match. Please try again."
done
az group create --name $vmName --location eastus
az deployment group create --resource-group $vmName --template-file template.json --parameters adminUsername=$username adminPassword=$password 

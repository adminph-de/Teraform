az account list --output table
az account set --subscription "My Demos"



az container show --resource-group sea-core-network-p --name aci-backend__10_3_20_128__27 --query ipAddress.ip --output tsv

az network profile list --resource-group sea-core-network-p --query [0].id --output tsv

az container show --resource-group sea-aci-p --name goanywhere-mft --query ipAddress.ip --output tsv

--vnet /subscriptions/00bb5d82-5e23-4972-ae4f-3d9b0afa73b2/resourceGroups/sea-core-network-p/providers/Microsoft.Network/virtualNetworks/azus2-spoke-1-vnet-p --vnet-address-prefix 10.3.20.0/22 --subnet /subscriptions/00bb5d82-5e23-4972-ae4f-3d9b0afa73b2/resourceGroups/sea-core-network-p/providers/Microsoft.Network/virtualNetworks/azus2-spoke-1-vnet-p/subnets/aci-backend__10_3_20_128__27 --subnet-address-prefix 10.3.20.128/27

az container create --name appcontainer --resource-group sea-aci-p --image microsoft/aci-helloworld --vnet /subscriptions/00bb5d82-5e23-4972-ae4f-3d9b0afa73b2/resourceGroups/sea-core-network-p/providers/Microsoft.Network/virtualNetworks/azus2-spoke-1-vnet-p --vnet-address-prefix 10.3.20.0/22 --subnet /subscriptions/00bb5d82-5e23-4972-ae4f-3d9b0afa73b2/resourceGroups/sea-core-network-p/providers/Microsoft.Network/virtualNetworks/azus2-spoke-1-vnet-p/subnets/aci-backend__10_3_20_128__27 --subnet-address-prefix 10.3.20.128/27
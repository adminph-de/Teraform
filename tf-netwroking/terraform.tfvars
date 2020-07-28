vnet-location       = "australiaeast"
vnet-resource-group = "syd-core-network-p"

vnet-name           = "azau1-spoke-1-vnet-p"
vnet-address-space  = "10.3.180.0/22"
vnet-dns-servers    = ["10.31.0.192", "8.8.8.8"]

default-name        = "default__10_3_182_0__23"
default-subnet      = "10.3.182.0/23"

bastion-host-name   = "syd-spoke-1-bastion-p"
bastion-subnet      = "10.3.180.64/26"
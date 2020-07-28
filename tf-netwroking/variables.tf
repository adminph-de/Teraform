variable "vnet-location" {   
  description = "Location of the network"    
}
variable "vnet-resource-group" { 
  description = "Resource Groupe Name"
}
variable "vnet-name" {      
  description = "VNet Name"     
}
variable "vnet-address-space" {
  description = "VNet Address Space"
}
variable "vnet-dns-servers" {
  description = "Customized DNS Servers of the VNet"
}
variable "default-name" {    
  description = "Default Network Name for VMs etc."    
}
variable "default-subnet" {   
  description = "Address scope for the default Network"  
}
variable "bastion-host-name" {   
  description = "Hostname of the Bastian Host (allign with the VNet Name)"
}
variable "bastion-subnet" {     
  description = "Scope for the Bastion Subnet (smalles possible /26)" 
}
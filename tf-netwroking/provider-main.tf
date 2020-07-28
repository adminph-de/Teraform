terraform {
  required_version = ">= 0.12"
  backend "azurerm" {
    resource_group_name  = "terraform-tfstate-westus2"
    storage_account_name = "tfstate15367159"
    container_name       = "core-tfstate"
    key                  = "core.network.tfstate"
  }
}
# Configure the Azure provider
provider "azurerm" { 
  version = "~>2.00"
  environment = "public"
  features {}
}
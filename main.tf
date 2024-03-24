resource "azurerm_resource_group" "c2c-rg" {
  name     = "C2C-RG"
  location = "east us"
}

module "vnet" {
  source = "./modules/vnet"
  # Add any required variables here
}

module "subnet" {
  source = "./modules/subnet"
  # Add any required variables here
}
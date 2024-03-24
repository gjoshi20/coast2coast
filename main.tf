resource "azurerm_resource_group" "c2c-rg" {
  name     = "C2C-RG"
  location = "east us"
}

module "vnet" {
  source = "./modules/vnet"
  # Add any required variables here
  vnet_name           = var.vnet_name
  location            = azurerm_resource_group.resource_group_name.location
  resource_group_name = azurerm_resource_group.resource_group_name.name
  address_space       = var.address_space

}

module "subnet" {
  source = "./modules/subnet"
  # Add any required variables here
  vnet_name            = var.vnet_name
  subnet_name          = var.subnet_name
  resource_group_name  = var.resource_group_name
  address_prefixes     = var.address_prefixes
}
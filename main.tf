resource "azurerm_resource_group" "c2c-rg" {
  for_each = { for region in var.regions : region => region }

  name     = "C2C-RG-${each.value}"
  location = "${each.value} us"
}

# Output the names of the resource groups for east and west regions
output "east_rg_name" {
  value = azurerm_resource_group.c2c_rg["east"].name
}

output "east_rg_location" {
  value = azurerm_resource_group.c2c_rg["east"].location
}

output "west_rg_name" {
  value = azurerm_resource_group.c2c_rg["west"] != null ? azurerm_resource_group.c2c_rg["west"].name : null
}

output "west_rg_location" {
  value = azurerm_resource_group.c2c_rg["west"].location
}
module "vnet" {
  source = "./modules/vnet"
  # Add any required variables here
  vnet_name           = "C2C-vnet-east" 
  location            = east_rg_location
  resource_group_name = east_rg_name
  address_space       = var.address_space

}

module "vnet" {
  source = "./modules/vnet"
  # Add any required variables here
  vnet_name           = "C2C-vnet-west" 
  location            = west_rg_location
  resource_group_name = west_rg_name
  address_space       = var.address_space
}

module "subnet" {
  source = "./modules/subnet"
# Add any required variables here
  vnet_name           = var.vnet_name
  subnet_name         = var.subnet_name
  resource_group_name = var.resource_group_name
  address_prefixes    = var.address_prefixes
}
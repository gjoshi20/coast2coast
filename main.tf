resource "azurerm_resource_group" "c2c-rg" {
  for_each = var.regions

  name     = "C2C-RG-${each.value}"
  location = each.value
}

# Output the names of the resource groups for east and west regions
output "east_rg_name" {
  value = azurerm_resource_group.c2c-rg["east"].name
}

output "east_rg_location" {
  value = azurerm_resource_group.c2c-rg["east"].location
}

output "west_rg_name" {
  value = azurerm_resource_group.c2c-rg["west"].name
}

output "west_rg_location" {
  value = azurerm_resource_group.c2c-rg["west"].location
}



/*
Create VNets in each region
resource "azurerm_virtual_network" "vnets" {
  for_each = { for region in var.regions : region => region }

  name                = "C2C-VNET-${each.value}"
  location            = var.resource_groups[each.value].location
  resource_group_name = var.resource_groups[each.value].name
  address_space       = ["10.${each.key}.0.0/16"]
}
*/
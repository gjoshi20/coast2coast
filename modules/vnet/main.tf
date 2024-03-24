# Define the Azure VNet
resource "azurerm_virtual_network" "main" {
  name                = var.vnet_name
  location            = azurerm_resource_group.resource_group_name.location
  resource_group_name = azurerm_resource_group.resource_group_name.name
  address_space       = var.address_space

  tags = var.tags
}

# Output the ID of the VNet for reference
output "vnet_id" {
  value = azurerm_virtual_network.main.id
}
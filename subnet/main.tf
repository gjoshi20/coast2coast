# Define the Azure subnet
resource "azurerm_subnet" "main" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes     = var.address_prefixes
}

# Output the ID of the subnet for reference
output "subnet_id" {
  value = azurerm_subnet.main.id
}

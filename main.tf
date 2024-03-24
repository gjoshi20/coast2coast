resource "azurerm_resource_group" "c2c-rg" {
  for_each = { for region in var.regions : region => region }

  name     = "C2C-RG-${each.value}"
  location = "${each.value} us"
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
  vnet_name           = var.vnet_name
  subnet_name         = var.subnet_name
  resource_group_name = var.resource_group_name
  address_prefixes    = var.address_prefixes
}
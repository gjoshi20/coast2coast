resource "azurerm_resource_group" "c2c-rg" {
  for_each = { for region, region in var.regions : region => region }
  name     = "C2C-RG-${each.value}"
  location = each.value
}

output "resource_group_names" {
  value       = [for rg in azurerm_resource_group.c2c-rg : rg.name]
  description = "The names of the created resource groups"
}

resource "azurerm_storage_account" "c2c_sa" {
  for_each                 = { for region, region in var.regions : region => region }
  name                     = "c2csa${replace(each.value, "-", "")}"
  resource_group_name      = azurerm_resource_group.c2c-rg[each.value].name
  location                 = azurerm_resource_group.c2c-rg[each.value].location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "container" {
  for_each             = azurerm_storage_account.c2c_sa
  name                 = "container${replace(each.value.location, "-", "")}"
  storage_account_name = each.value.name
}

output "storage_account_names" {
  value       = [for sa in azurerm_storage_account.c2c_sa : sa.name]
  description = "The names of the created storage accounts"
}

output "storage_container_names" {
  value       = [for container in azurerm_storage_container.container : container.name]
  description = "The names of the created storage containers"
}

# Path: coast2coast/variables.tf



resource "azurerm_virtual_network" "c2c_vnet" {
  for_each            = { for region, region in var.regions : region => region }
  name                = "c2cvnet${replace(each.value, "-", "")}"
  location            = azurerm_resource_group.c2c-rg[each.value].location
  resource_group_name = azurerm_resource_group.c2c-rg[each.value].name
  address_space       = each.value == "eastus" ? var.eastus_vnet_address_space : var.westus_vnet_address_space
}

resource "azurerm_subnet" "c2c_subnet" {
  for_each             = azurerm_virtual_network.c2c_vnet
  name                 = "c2csubnet${replace(each.value.location, "-", "")}"
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.name
  address_prefixes     = each.value.location == "eastus" ? var.eastus_subnet_address_space : var.westus_subnet_address_space
}

output "vnet_names" {
  value       = [for vnet in azurerm_virtual_network.c2c_vnet : vnet.name]
  description = "The names of the created virtual networks"
}

output "subnet_names" {
  value       = [for subnet in azurerm_subnet.c2c_subnet : subnet.name]
  description = "The names of the created subnets"
}


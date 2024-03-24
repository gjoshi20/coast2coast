resource "azurerm_resource_group" "c2c-rg" {
  for_each = { for loc, region in var.region : loc => region }

  name     = "C2C-rg-${each.value}"
  location = each.value
}
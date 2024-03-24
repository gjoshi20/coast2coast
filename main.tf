resource "azurerm_resource_group" "c2c-rg" {
  for_each = { for region, region in var.regions : region => region }
  name     = "C2C-RG-${each.value}"
  location = "${each.value} us"
}

#
variable "resource_group_name" {
  type    = string
  description = "The name of the Azure resource group where the VNet will be created."
}

variable "location" {
  type    = string
  description = "The Azure region where the VNet will be created."
}

variable "vnet_name" {
  type    = string
  description = "The name of the Azure VNet."
}

variable "address_space" {
  type    = list(string)
  description = "The address space for the VNet in CIDR notation. Example: ['10.0.0.0/16']"
}

variable "tags" {
  type    = map(string)
  description = "A map of tags to assign to the VNet."
  default = {}
}

variable "resource_groups" {
  type = map(object({
    name     = string
    location = string
  }))
  default = {
    east = {
      name     = azurerm_resource_group.c2c-rg["east"].name
      location = azurerm_resource_group.c2c-rg["east"].location
    }
    west = {
      name     = azurerm_resource_group.c2c-rg["west"].name
      location = azurerm_resource_group.c2c-rg["west"].location
    }
  }
}
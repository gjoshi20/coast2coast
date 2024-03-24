variable "regions" {
  type        = list(string)
  description = "A list of operating regions"
  default     = ["East"]
}


#Variables from the vnet module
variable "resource_group_name" {
  type        = string
  description = "The name of the Azure resource group where the VNet will be created."
}

variable "location" {
  type        = string
  description = "The Azure region where the VNet will be created."
}

variable "vnet_name" {
  type        = string
  description = "The name of the Azure VNet."
}

variable "address_space" {
  type        = list(string)
  description = "The address space for the VNet in CIDR notation. Example: ['10.0.0.0/16']"
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to assign to the VNet."
  default     = {}
}


#Variables from the subnet module
#variable "resource_group_name" {
#  type        = string
#  description = "The name of the Azure resource group where the subnet will be created."
#}

#variable "vnet_name" {
#  type        = string
#  description = "The name of the Azure VNet where the subnet will be created."
#}

variable "subnet_name" {
  type        = string
  description = "The name of the Azure subnet."
}

variable "address_prefixes" {
  type        = list(string)
  description = "The address prefixes for the subnet in CIDR notation. Example: ['10.0.1.0/24']"
}


#variable map for created resource groups and their location
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

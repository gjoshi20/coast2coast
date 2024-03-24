variable "resource_group_name" {
  type        = string
  description = "The name of the Azure resource group where the subnet will be created."
}

variable "vnet_name" {
  type        = string
  description = "The name of the Azure VNet where the subnet will be created."
}

variable "subnet_name" {
  type        = string
  description = "The name of the Azure subnet."
}

variable "address_prefixes" {
  type        = list(string)
  description = "The address prefixes for the subnet in CIDR notation. Example: ['10.0.1.0/24']"
}


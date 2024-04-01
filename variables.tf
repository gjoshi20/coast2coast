variable "regions" {
  type    = list(string)
  default = ["eastus", "westus"]
}

variable "eastus_vnet_address_space" {
  description = "Address space for the virtual network in eastus"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "westus_vnet_address_space" {
  description = "Address space for the virtual network in westus"
  type        = list(string)
  default     = ["192.168.0.0/16"]
}

variable "eastus_subnet_address_space" {
  description = "Address space for the subnet in eastus"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

variable "westus_subnet_address_space" {
  description = "Address space for the subnet in westus"
  type        = list(string)
  default     = ["192.168.1.0/24"]
}
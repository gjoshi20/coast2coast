variable "region" {
  type        = list(string)
  description = "A list of operating regions"
  default     = ["East"]
}

variable "vnet_name" {
  type    = string
  default = "example-vnet"
}

variable "subnet_name" {
  type    = string
  default = "example-subnet"
}
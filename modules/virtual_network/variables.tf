variable "vnet_name" {
  description = "Virtual network name"
  type        = string
}

variable "location" {
  description = "Azure region to deploy resources"
  type        = string
}

variable "rg_name" {
  description = "Resource group name"
  type        = string
}

variable "vnet_cidr" {
  description = "Address space (CIDR block) to assign to the virtual network"
  type = string
}
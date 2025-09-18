variable "sub_name" {
  description = "Subnet name"
  type        = string
}

variable "rg_name" {
  description = "Resource group name"
  type        = string
}

variable "vnet_name" {
  description = "Virtual network name"
  type        = string
}

variable "subnet_cidr" {
  description = "Address space (CIDR block) to assign to the subnet"
  type = string
}

variable "enable_delegation" {
  description = "Whether to enable delegation for this subnet"
  type    = bool
  default = false
}

variable "delegation_service" {
  description = "Azure service to which the subnet will be delegated"
  type    = string
  default = null
}
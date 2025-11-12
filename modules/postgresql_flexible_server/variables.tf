variable "rg_name" {
  description = "Resource group name"
  type        = string
}

variable "pg_name" {
  description = "Postgres flexible server name"
  type        = string
}

variable "rg_location" {
  description = "Azure region to deploy resources"
  type        = string
}

variable "virtual_network_id" {
  description = "Virtual network ID created for resources"
  type        = string
}

variable "delegated_subnet_id" {
  description = "Delegated subnet ID created for Postgres"
  type        = string
}

variable "private_dns_zone_name" {
  description = "Private DNS Zone name for Postgres"
  type        = string
}

variable "administrator_login" {
  description = "Administrator username to Postgres"
  type        = string
}

variable "administrator_password" {
  description = "Administrator password to Postgres"
  type        = string
}
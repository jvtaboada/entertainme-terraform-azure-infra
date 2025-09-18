variable "tenant_id" {
  description = "Azure Tenant ID"
  type        = string
}

variable "subscription_id" {
  description = " Azure Subscription ID"
  type        = string
}

variable "azure_region" {
  description = "Azure region to deploy resources"
  type        = string
}

variable "environment" {
  description = "Environment type to deploy"
  type        = string
}
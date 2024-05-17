variable "subscription_id" {
  description = "The ID (UUID) of the Azure Subscription where resources will be deployed"
  type        = string
}

variable "location" {
  description = "The location where the identity will be deployed"
  type        = string
}

variable "corelight_resource_group_name" {
  description = "The resource group where the user defined identity will be deployed"
  type        = string
}

variable "app_identity_name" {
  description = "The name of the user assignment identity which the Container App will run as"
  type        = string
  default     = "corelight-enrichment-user"
}

variable "enrichment_role_definition_name" {
  description = "The name of the custom Corelight enrichment role definition"
  type        = string
  default     = "corelight-enrichment-role"
}
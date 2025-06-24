variable "subscription_id" {
  description = "The ID (UUID) of the Azure Subscription where resources will be deployed"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group where resources will be deployed"
  type        = string
}

variable "location" {
  description = "Azure location where resources will be deployed"
  type        = string
}

variable "enrichment_storage_account" {
  description = "The storage account where enrichment data will be centralized"
  type        = string
}

variable "enrichment_storage_account_container" {
  description = "The storage account container that will store the cloud resource data"
  type        = string
}

variable "event_grid_system_topic_name" {
  description = "The name of the event grid system topic"
  type        = string
}

variable "event_grid_system_topic_resource_group" {
  description = "The resource group of the event grid system topic"
  type        = string
}

## Variables with defaults
variable "image_name" {
  description = "The name of the Corelight Azure enrichment application"
  type        = string
  default     = "corelight/sensor-enrichment-azure"
}

variable "image_tag" {
  description = "The tag for the Corelight Azure enrichment application"
  type        = string
  default     = "latest"
}

variable "app_container_name" {
  description = "The name of the running enrichment container"
  type        = string
  default     = "corelightcloudenrichment"
}

variable "app_container_cpu" {
  description = "The CPU allocated for the container"
  type        = number
  default     = 0.25
}
variable "app_container_memory" {
  description = "The memory allocated for the container"
  type        = string
  default     = "0.5Gi"
}

variable "event_grid_subscription_name" {
  description = "The name of the EventGrid subscription on the System Topic"
  type        = string
  default     = "corelight-system-topic-sub"
}

variable "service_bus_name" {
  description = "The name of the Service Bus which will notify the Container App of resource state changes"
  type        = string
  default     = "corelight-enrichment-state-change-bus"
}

variable "service_bus_queue_name" {
  description = "The Service Bus Queue which the Container App will be subscribed to"
  type        = string
  default     = "corelight-enrichment-state-change-queue"
}

variable "app_name" {
  description = "The name of the enrichment Container App"
  type        = string
  default     = "corelight-cloud-enrichment"
}

variable "app_sku" {
  description = "The enrichment Container App SKU"
  type        = string
  default     = "PerGB2018"
}

variable "app_env_locations" {
  description = "The Azure locations the Container App should collect cloud resource data"
  type        = list(string)
  default = [
    "eastus",
    "eastus2",
    "southcentralus",
    "westus2",
    "westus3",
    "australiaeast",
    "southeastasia",
    "northeurope",
    "swedencentral",
    "uksouth",
    "westeurope",
    "centralus",
    "southafricanorth",
    "centralindia",
    "eastasia",
    "japaneast",
    "koreacentral",
    "canadacentral",
    "francecentral",
    "germanywestcentral",
    "italynorth",
    "norwayeast",
    "polandcentral",
    "switzerlandnorth",
    "uaenorth",
    "brazilsouth",
    "centraluseuap",
    "israelcentral",
    "qatarcentral",
  ]
}

variable "app_env_object_prefix" {
  description = "The prefix prepended to all objects written to the Azure storage account container"
  type        = string
  default     = "corelight"
}

variable "app_env_log_level" {
  description = "The log level the Container App should run. Set to \"debug\" while troubleshooting for additional context and logs"
  type        = string
  default     = "info"
}

variable "app_environment_name" {
  description = "The name of the Container App Environment used by the Container App"
  type        = string
  default     = "corelight-app-env"
}

variable "app_log_retention" {
  description = "How long the Container App should retain logs"
  type        = number
  default     = 30
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

variable "tags" {
  description = "(optional) Any tags that should be applied to resources deployed by the module"
  type        = object({})
  default     = {}
}

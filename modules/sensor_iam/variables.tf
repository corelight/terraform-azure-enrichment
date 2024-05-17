variable "enrichment_bucket_id" {
  description = "The resource id of the enrichment bucket"
  type        = string
}

variable "sensor_vmss_identity_principal_id" {
  description = "The Corelight Sensor (VMSS) identity principal ID"
  type        = string
}

variable "sensor_iam_role_definition_name" {
  description = "The name of the custom Corelight enrichment role definition used to access "
  type        = string
  default     = "Storage Blob Data Reader"
}



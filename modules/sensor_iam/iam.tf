resource "azurerm_role_assignment" "enrichment_bucket_read" {
  principal_id         = var.sensor_vmss_identity_principal_id
  scope                = var.enrichment_bucket_id
  role_definition_name = var.sensor_iam_role_definition_name
}

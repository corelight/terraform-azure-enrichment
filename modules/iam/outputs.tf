output "user_assigned_identity_name" {
  value = azurerm_user_assigned_identity.app_identity.name
}

output "corelight_role_definition_id" {
  value = azurerm_role_definition.enrichment_role_def.id
}
resource "azurerm_role_assignment" "service_bus_role_assignment" {
  principal_id         = data.azurerm_user_assigned_identity.identity.principal_id
  scope                = azurerm_servicebus_queue.state_change_queue.id
  role_definition_name = "Azure Service Bus Data Receiver"
}

resource "azurerm_role_assignment" "enrichment_data_assignment" {
  principal_id         = data.azurerm_user_assigned_identity.identity.principal_id
  scope                = data.azurerm_storage_account.enrichment_storage_account.id
  role_definition_name = "Storage Blob Data Contributor"
}
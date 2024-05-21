resource "azurerm_user_assigned_identity" "app_identity" {
  name                = var.app_identity_name
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_role_definition" "enrichment_role_def" {
  name  = var.enrichment_role_definition_name
  scope = data.azurerm_subscription.subscription.id

  permissions {
    actions = [
      "Microsoft.Compute/virtualMachines/read",
      "Microsoft.ClassicCompute/virtualMachines/read",
      "Microsoft.Network/networkInterfaces/read",
      "Microsoft.Network/networkSecurityGroups/read",
      "Microsoft.Network/internalPublicIpAddresses/read"
    ]
  }
}

resource "azurerm_role_assignment" "enrichment_role_assignment" {
  principal_id         = azurerm_user_assigned_identity.app_identity.principal_id
  scope                = data.azurerm_subscription.subscription.id
  role_definition_name = azurerm_role_definition.enrichment_role_def.name
}

resource "azurerm_role_assignment" "service_bus_role_assignment" {
  principal_id         = azurerm_user_assigned_identity.app_identity.principal_id
  scope                = azurerm_servicebus_queue.state_change_queue.id
  role_definition_name = "Azure Service Bus Data Receiver"
}

resource "azurerm_role_assignment" "enrichment_storage_account_assignment" {
  principal_id         = azurerm_user_assigned_identity.app_identity.principal_id
  scope                = data.azurerm_storage_account.enrichment_storage_account.id
  role_definition_name = "Storage Blob Data Contributor"
}
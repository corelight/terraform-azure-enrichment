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
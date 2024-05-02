data azurerm_subscription "subscription" {
  subscription_id = var.subscription_id
}

data azurerm_user_assigned_identity "identity" {
  name                = var.user_assigned_identity_name
  resource_group_name = var.resource_group_name
}

data azurerm_storage_account "enrichment_storage_account" {
  name                = var.enrichment_storage_account
  resource_group_name = var.resource_group_name
}
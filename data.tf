data "azurerm_subscription" "subscription" {
  subscription_id = var.subscription_id
}

data "azurerm_storage_account" "enrichment_storage_account" {
  name                = var.enrichment_storage_account
  resource_group_name = var.resource_group_name
}

data "azurerm_eventgrid_system_topic" "system_topic" {
  name                = var.event_grid_system_topic_name
  resource_group_name = var.event_grid_system_topic_resource_group
}
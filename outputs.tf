output "workspace_log_analytics_workspace_name" {
  value = azurerm_log_analytics_workspace.enrichment_log_analytics.name
}

output "container_app_environment_name" {
  value = azurerm_container_app_environment.enrichment_app_env.name
}

output "container_app_name" {
  value = azurerm_container_app.enrichment_app.name
}

output "event_grid_system_topic_subscription_name" {
  value = azurerm_eventgrid_system_topic_event_subscription.event_subscription.name
}

output "service_bus_namespace_name" {
  value = azurerm_servicebus_namespace.state_change_bus.name
}

output "service_bus_queue_name" {
  value = azurerm_servicebus_queue.state_change_queue.name
}

output "user_assigned_identity_name" {
  value = azurerm_user_assigned_identity.app_identity.name
}

output "user_assigned_identity_principal_id" {
  value = azurerm_user_assigned_identity.app_identity.principal_id
}

output "corelight_role_definition_id" {
  value = azurerm_role_definition.enrichment_role_def.id
}
resource "azurerm_servicebus_namespace" "state_change_bus" {
  location            = var.location
  name                = var.service_bus_name
  resource_group_name = var.resource_group_name
  sku                 = "Standard"
  local_auth_enabled  = false
  minimum_tls_version = "1.2"

  network_rule_set {
    trusted_services_allowed = true
    ip_rules = [
      azurerm_container_app_environment.enrichment_app_env.static_ip_address
    ]
  }

  tags = var.tags
}

resource "azurerm_servicebus_queue" "state_change_queue" {
  name         = var.service_bus_queue_name
  namespace_id = azurerm_servicebus_namespace.state_change_bus.id
}
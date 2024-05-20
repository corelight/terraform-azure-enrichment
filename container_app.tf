resource "azurerm_log_analytics_workspace" "enrichment_log_analytics" {
  name                = var.app_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.app_sku
  retention_in_days   = var.app_log_retention

  tags = var.tags
}

resource "azurerm_container_app_environment" "enrichment_app_env" {
  name                       = var.app_environment_name
  location                   = var.location
  resource_group_name        = var.resource_group_name
  log_analytics_workspace_id = azurerm_log_analytics_workspace.enrichment_log_analytics.id

  tags = var.tags
}

resource "azurerm_container_app" "enrichment_app" {
  name                         = var.app_name
  container_app_environment_id = azurerm_container_app_environment.enrichment_app_env.id
  resource_group_name          = var.resource_group_name
  revision_mode                = "Single"

  identity {
    type = "UserAssigned"
    identity_ids = [
      azurerm_user_assigned_identity.app_identity.id
    ]
  }

  template {
    min_replicas = 1
    container {
      name   = var.app_container_name
      image  = "docker.io/${var.image_name}:${var.image_tag}"
      cpu    = var.app_container_cpu
      memory = var.app_container_memory

      env {
        name  = "SUBSCRIPTION_ID"
        value = var.subscription_id
      }
      env {
        name  = "LOCATIONS"
        value = join(",", var.app_env_locations)
      }
      env {
        name  = "AZURE_STORAGE_ACCOUNT"
        value = var.enrichment_storage_account
      }
      env {
        name  = "AZURE_CLIENT_ID"
        value = azurerm_user_assigned_identity.app_identity.client_id
      }
      env {
        name  = "CONTAINER_NAME"
        value = var.enrichment_storage_account_container
      }
      env {
        name  = "PREFIX"
        value = var.app_env_object_prefix
      }
      env {
        name  = "SERVICE_BUS_NAMESPACE_FQDN"
        value = format("%s.servicebus.windows.net", azurerm_servicebus_namespace.state_change_bus.name)
      }
      env {
        name  = "SERVICE_BUS_QUEUE_NAME"
        value = azurerm_servicebus_queue.state_change_queue.name
      }
      env {
        name  = "LOG_LEVEL"
        value = var.app_env_log_level
      }
    }
  }

  tags = var.tags
}
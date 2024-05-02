resource "azurerm_user_assigned_identity" "app_identity" {
  name                = var.app_identity_name
  location            = var.location
  resource_group_name = var.corelight_resource_group_name
}
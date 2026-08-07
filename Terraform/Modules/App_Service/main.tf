resource "azurerm_service_plan" "asp" {
  name                = var.app_service_plan_name
  location            = var.location
  resource_group_name = var.resource_group_name
  os_type             = "Linux"
  sku_name            = var.sku_name
  tags                = var.tags
}

resource "azurerm_linux_web_app" "webapp" {
  name                = var.app_name
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id     = azurerm_service_plan.asp.id

  site_config {
    always_on = true
    application_stack {
      node_version = var.node_version
    }
  }

  app_settings = var.app_settings
  tags         = var.tags
}

resource "azurerm_app_service_virtual_network_swift_connection" "vnet_integration" {
  count          = var.subnet_id != "" ? 1 : 0
  app_service_id = azurerm_linux_web_app.webapp.id
  subnet_id      = var.subnet_id
}

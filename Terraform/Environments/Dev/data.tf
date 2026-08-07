data "azurerm_subnet" "aks_subnet" {
  name                 = var.aks_subnet_name
  virtual_network_name = var.vnet_name
  resource_group_name  = var.resource_group_name

  depends_on = [module.azure_network]
}

data "azurerm_subnet" "appservice_subnet" {
  name                 = var.appservice_subnet_name
  virtual_network_name = var.vnet_name
  resource_group_name  = var.resource_group_name

  depends_on = [module.azure_network]
}

data "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = var.resource_group_name

  depends_on = [module.acr]
}

data "azurerm_log_analytics_workspace" "law" {
  name                = var.log_analytics_name
  resource_group_name = var.resource_group_name

  depends_on = [module.monitoring]
}

data "azurerm_key_vault" "kv" {
  name                = var.key_vault_name
  resource_group_name = var.resource_group_name

  depends_on = [module.key_vault]
}

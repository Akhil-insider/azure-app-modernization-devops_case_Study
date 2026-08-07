module "resource_group" {
  source              = "../../Modules/Resource_Group"
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags
}

module "azure_network" {
  source     = "../../Modules/Azure_Network"
  vnets      = var.vnets
  subnets    = var.subnets
  nsgs       = var.nsgs
  tags       = var.tags
  depends_on = [module.resource_group]
}

module "acr" {
  source     = "../../Modules/ACR"
  acrs       = var.acrs
  tags       = var.tags
  depends_on = [module.resource_group]
}

module "monitoring" {
  source              = "../../Modules/Monitoring"
  log_analytics_name = var.log_analytics_name
  app_insights_name  = var.app_insights_name
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags
  depends_on          = [module.resource_group]
}

module "key_vault" {
  source              = "../../Modules/Key_Vault"
  key_vault_name      = var.key_vault_name
  resource_group_name = var.resource_group_name
  location            = var.location
  tenant_id           = var.tenant_id
  tags                = var.tags
  depends_on          = [module.resource_group]
}

module "aks" {
  source                      = "../../Modules/AKS"
  aks_cluster_name            = var.aks_cluster_name
  resource_group_name         = var.resource_group_name
  location                    = var.location
  dns_prefix                  = "aks-dev-dns"
  system_node_count           = 1
  min_node_count              = 1
  max_node_count              = 2
  system_vm_size              = "Standard_B2ms"
  vnet_subnet_id              = data.azurerm_subnet.aks_subnet.id
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.law.id
  acr_id                      = data.azurerm_container_registry.acr.id
  tags                        = var.tags

  depends_on = [
    module.azure_network,
    module.acr,
    module.monitoring
  ]
}

module "app_service" {
  source                 = "../../Modules/App_Service"
  app_service_plan_name  = var.app_service_plan_name
  app_name               = var.app_name
  resource_group_name    = var.resource_group_name
  location               = var.location
  sku_name               = "B1"
  subnet_id              = data.azurerm_subnet.appservice_subnet.id
  tags                   = var.tags

  depends_on = [
    module.azure_network
  ]
}

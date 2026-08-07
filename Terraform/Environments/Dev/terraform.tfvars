location            = "uaenorth"
resource_group_name = "rg-dev-uaenorth-001"

tags = {
  Environment = "Development"
  ManagedBy   = "Terraform"
  Project     = "Azure-Case-Study"
  Region      = "UAE North"
}

vnet_name              = "vnet-dev-uaenorth-001"
aks_subnet_name        = "snet-aks-dev"
appservice_subnet_name = "snet-appservice-dev"
acr_name               = "acrdevuaenorth001"
log_analytics_name     = "law-dev-uaenorth-001"
app_insights_name      = "appi-dev-uaenorth-001"
key_vault_name         = "kv-dev-uaenorth-001"
tenant_id              = "11111111-2222-3333-4444-555555555555"

aks_cluster_name       = "aks-dev-uaenorth-001"
app_service_plan_name  = "asp-dev-uaenorth-001"
app_name               = "app-dev-uaenorth-001"

vnets = {
  "dev_vnet" = {
    vnet_name     = "vnet-dev-uaenorth-001"
    rg_name       = "rg-dev-uaenorth-001"
    location      = "uaenorth"
    address_space = ["10.200.0.0/16"]
  }
}

subnets = {
  "aks_subnet" = {
    subnet_name      = "snet-aks-dev"
    vnet_key         = "dev_vnet"
    rg_name          = "rg-dev-uaenorth-001"
    address_prefixes = ["10.200.0.0/20"]
    nsg_key          = "aks_nsg"
  }
  "appservice_subnet" = {
    subnet_name      = "snet-appservice-dev"
    vnet_key         = "dev_vnet"
    rg_name          = "rg-dev-uaenorth-001"
    address_prefixes = ["10.200.16.0/24"]
    nsg_key          = "appservice_nsg"
    service_delegation = {
      name         = "Microsoft.Web/serverFarms"
      service_name = "Microsoft.Web/serverFarms"
      actions      = ["Microsoft.Network/virtualNetworks/subnets/action"]
    }
  }
}

nsgs = {
  "aks_nsg" = {
    nsg_name = "nsg-aks-dev-001"
    rg_name  = "rg-dev-uaenorth-001"
    location = "uaenorth"
    security_rule = {
      "allow_http" = {
        security_rule_name         = "Allow-HTTP-Inbound"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "Internet"
        destination_address_prefix = "*"
      }
    }
  }
  "appservice_nsg" = {
    nsg_name = "nsg-appservice-dev-001"
    rg_name  = "rg-dev-uaenorth-001"
    location = "uaenorth"
    security_rule = {
      "allow_http" = {
        security_rule_name         = "Allow-HTTP-Inbound"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "Internet"
        destination_address_prefix = "*"
      }
    }
  }
}

acrs = {
  "dev_acr" = {
    acr_name                      = "acrdevuaenorth001"
    rg_name                       = "rg-dev-uaenorth-001"
    location                      = "uaenorth"
    sku                           = "Standard"
    admin_enabled                 = true
    public_network_access_enabled = true
  }
}

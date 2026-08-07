location            = "uaenorth"
resource_group_name = "rg-prod-uaenorth-001"

tags = {
  Environment = "Production"
  ManagedBy   = "Terraform"
  Project     = "Azure-Case-Study"
  Region      = "UAE North"
}

vnet_name              = "vnet-prod-uaenorth-001"
aks_subnet_name        = "snet-aks-prod"
appservice_subnet_name = "snet-appservice-prod"
acr_name               = "acrproduaenorth001"
log_analytics_name     = "law-prod-uaenorth-001"
app_insights_name      = "appi-prod-uaenorth-001"
key_vault_name         = "kv-prod-uaenorth-001"
tenant_id              = "11111111-2222-3333-4444-555555555555"

aks_cluster_name       = "aks-prod-uaenorth-001"
app_service_plan_name  = "asp-prod-uaenorth-001"
app_name               = "app-prod-uaenorth-001"

vnets = {
  "prod_vnet" = {
    vnet_name     = "vnet-prod-uaenorth-001"
    rg_name       = "rg-prod-uaenorth-001"
    location      = "uaenorth"
    address_space = ["10.100.0.0/16"]
  }
}

subnets = {
  "aks_subnet" = {
    subnet_name      = "snet-aks-prod"
    vnet_key         = "prod_vnet"
    rg_name          = "rg-prod-uaenorth-001"
    address_prefixes = ["10.100.0.0/20"]
    nsg_key          = "aks_nsg"
  }
  "appservice_subnet" = {
    subnet_name      = "snet-appservice-prod"
    vnet_key         = "prod_vnet"
    rg_name          = "rg-prod-uaenorth-001"
    address_prefixes = ["10.100.16.0/24"]
    nsg_key          = "appservice_nsg"
    service_delegation = {
      name         = "Microsoft.Web/serverFarms"
      service_name = "Microsoft.Web/serverFarms"
      actions      = ["Microsoft.Network/virtualNetworks/subnets/action"]
    }
  }
  "pe_subnet" = {
    subnet_name      = "snet-privateendpoints-prod"
    vnet_key         = "prod_vnet"
    rg_name          = "rg-prod-uaenorth-001"
    address_prefixes = ["10.100.32.0/24"]
    nsg_key          = "default_nsg"
  }
}

nsgs = {
  "aks_nsg" = {
    nsg_name = "nsg-aks-prod-001"
    rg_name  = "rg-prod-uaenorth-001"
    location = "uaenorth"
    security_rule = {
      "allow_https" = {
        security_rule_name         = "Allow-HTTPS-Inbound"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "443"
        source_address_prefix      = "Internet"
        destination_address_prefix = "*"
      }
      "allow_http" = {
        security_rule_name         = "Allow-HTTP-Inbound"
        priority                   = 110
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
    nsg_name = "nsg-appservice-prod-001"
    rg_name  = "rg-prod-uaenorth-001"
    location = "uaenorth"
    security_rule = {
      "allow_app_service" = {
        security_rule_name         = "Allow-AppService-HTTPS"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "443"
        source_address_prefix      = "Internet"
        destination_address_prefix = "*"
      }
    }
  }

  "default_nsg" = {
    nsg_name = "nsg-default-prod-001"
    rg_name  = "rg-prod-uaenorth-001"
    location = "uaenorth"
    security_rule = {
      "deny_all_inbound" = {
        security_rule_name         = "Deny-All-Inbound"
        priority                   = 4096
        direction                  = "Inbound"
        access                     = "Deny"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_range     = "*"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    }
  }
}

acrs = {
  "prod_acr" = {
    acr_name                      = "acrproduaenorth001"
    rg_name                       = "rg-prod-uaenorth-001"
    location                      = "uaenorth"
    sku                           = "Premium"
    admin_enabled                 = false
    public_network_access_enabled = true
  }
}

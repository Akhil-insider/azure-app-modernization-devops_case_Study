variable "location" {
  description = "Target Azure Region"
  type        = string
  default     = "uaenorth"
}

variable "resource_group_name" {
  description = "Production Resource Group Name"
  type        = string
  default     = "rg-prod-uaenorth-001"
}

variable "tags" {
  description = "Common Resource Tags"
  type        = map(string)
  default = {
    Environment = "Production"
    ManagedBy   = "Terraform"
    Project     = "Azure-Case-Study"
    Region      = "UAE North"
  }
}

variable "vnet_name" {
  type    = string
  default = "vnet-prod-uaenorth-001"
}

variable "aks_subnet_name" {
  type    = string
  default = "snet-aks-prod"
}

variable "appservice_subnet_name" {
  type    = string
  default = "snet-appservice-prod"
}

variable "acr_name" {
  type    = string
  default = "acrproduaenorth001"
}

variable "log_analytics_name" {
  type    = string
  default = "law-prod-uaenorth-001"
}

variable "app_insights_name" {
  type    = string
  default = "appi-prod-uaenorth-001"
}

variable "key_vault_name" {
  type    = string
  default = "kv-prod-uaenorth-001"
}

variable "tenant_id" {
  description = "Azure AD Tenant ID"
  type        = string
  default     = "00000000-0000-0000-0000-000000000000" # Placeholder to be overridden
}

variable "aks_cluster_name" {
  type    = string
  default = "aks-prod-uaenorth-001"
}

variable "app_service_plan_name" {
  type    = string
  default = "asp-prod-uaenorth-001"
}

variable "app_name" {
  type    = string
  default = "app-prod-uaenorth-001"
}

variable "vnets" {
  description = "Virtual Network Details"
  type = map(object({
    vnet_name     = string
    rg_name       = string
    location      = string
    address_space = list(string)
  }))
}

variable "subnets" {
  description = "Subnet Details"
  type = map(object({
    subnet_name      = string
    vnet_key         = string
    rg_name          = string
    address_prefixes = list(string)
    nsg_key          = optional(string)
    service_delegation = optional(object({
      name         = string
      service_name = string
      actions      = list(string)
    }))
  }))
}

variable "nsgs" {
  description = "Network Security Group Details"
  type = map(object({
    nsg_name = string
    rg_name  = string
    location = string

    security_rule = map(object({
      security_rule_name         = string
      priority                   = number
      direction                  = string
      access                     = string
      protocol                   = string
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string
    }))
  }))
}

variable "acrs" {
  description = "Azure Container Registry Details"
  type = map(object({
    acr_name                      = string
    rg_name                       = string
    location                      = string
    sku                           = string
    admin_enabled                 = bool
    public_network_access_enabled = bool
  }))
}

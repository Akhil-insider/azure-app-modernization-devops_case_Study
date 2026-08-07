variable "location" {
  description = "Target Azure Region"
  type        = string
  default     = "uaenorth"
}

variable "resource_group_name" {
  description = "Dev Resource Group Name"
  type        = string
  default     = "rg-dev-uaenorth-001"
}

variable "tags" {
  description = "Common Resource Tags"
  type        = map(string)
  default = {
    Environment = "Development"
    ManagedBy   = "Terraform"
    Project     = "Azure-Case-Study"
    Region      = "UAE North"
  }
}

variable "vnet_name" {
  type    = string
  default = "vnet-dev-uaenorth-001"
}

variable "aks_subnet_name" {
  type    = string
  default = "snet-aks-dev"
}

variable "appservice_subnet_name" {
  type    = string
  default = "snet-appservice-dev"
}

variable "acr_name" {
  type    = string
  default = "acrdevuaenorth001"
}

variable "log_analytics_name" {
  type    = string
  default = "law-dev-uaenorth-001"
}

variable "app_insights_name" {
  type    = string
  default = "appi-dev-uaenorth-001"
}

variable "key_vault_name" {
  type    = string
  default = "kv-dev-uaenorth-001"
}

variable "tenant_id" {
  type    = string
  default = "11111111-2222-3333-4444-555555555555"
}

variable "aks_cluster_name" {
  type    = string
  default = "aks-dev-uaenorth-001"
}

variable "app_service_plan_name" {
  type    = string
  default = "asp-dev-uaenorth-001"
}

variable "app_name" {
  type    = string
  default = "app-dev-uaenorth-001"
}

variable "vnets" {
  type = map(object({
    vnet_name     = string
    rg_name       = string
    location      = string
    address_space = list(string)
  }))
}

variable "subnets" {
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
  type = map(object({
    acr_name                      = string
    rg_name                       = string
    location                      = string
    sku                           = string
    admin_enabled                 = bool
    public_network_access_enabled = bool
  }))
}

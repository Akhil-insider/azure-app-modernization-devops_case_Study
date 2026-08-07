variable "app_service_plan_name" {
  description = "App Service Plan Name"
  type        = string
}

variable "app_name" {
  description = "Linux Web App Name"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
}

variable "location" {
  description = "Azure Region Location"
  type        = string
}

variable "sku_name" {
  description = "SKU for App Service Plan (e.g. P1v3)"
  type        = string
  default     = "P1v3"
}

variable "node_version" {
  description = "Application stack version (Node.js)"
  type        = string
  default     = "20-lts"
}

variable "subnet_id" {
  description = "Subnet ID for VNet Integration"
  type        = string
  default     = ""
}

variable "app_settings" {
  description = "App settings key-value map"
  type        = map(string)
  default     = {}
}

variable "tags" {
  description = "Resource Tags"
  type        = map(string)
  default     = {}
}

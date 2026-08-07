variable "log_analytics_name" {
  description = "Log Analytics Workspace name"
  type        = string
}

variable "app_insights_name" {
  description = "Application Insights name"
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

variable "sku" {
  description = "Log Analytics SKU"
  type        = string
  default     = "PerGB2018"
}

variable "retention_in_days" {
  description = "Log retention in days"
  type        = number
  default     = 30
}

variable "tags" {
  description = "Resource Tags"
  type        = map(string)
  default     = {}
}

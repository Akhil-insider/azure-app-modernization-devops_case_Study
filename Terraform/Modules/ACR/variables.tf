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

variable "tags" {
  description = "Common Tags"
  type        = map(string)
  default     = {}
}

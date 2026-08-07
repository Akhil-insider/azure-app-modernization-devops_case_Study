variable "tags" {
  description = "Common Tags"
  type        = map(string)
  default     = {}
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

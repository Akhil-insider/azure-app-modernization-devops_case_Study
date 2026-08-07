resource "azurerm_virtual_network" "vnet" {
  for_each            = var.vnets
  name                = each.value.vnet_name
  resource_group_name = each.value.rg_name
  location            = each.value.location
  address_space       = each.value.address_space
  tags                = var.tags
}

resource "azurerm_subnet" "subnet" {
  for_each             = var.subnets
  name                 = each.value.subnet_name
  virtual_network_name = azurerm_virtual_network.vnet[each.value.vnet_key].name
  resource_group_name  = each.value.rg_name
  address_prefixes     = each.value.address_prefixes

  dynamic "delegation" {
    for_each = lookup(each.value, "service_delegation", null) != null ? [each.value.service_delegation] : []
    content {
      name = delegation.value.name
      service_delegation {
        name    = delegation.value.service_name
        actions = delegation.value.actions
      }
    }
  }
}

resource "azurerm_network_security_group" "nsg" {
  for_each            = var.nsgs
  name                = each.value.nsg_name
  location            = each.value.location
  resource_group_name = each.value.rg_name
  tags                = var.tags

  dynamic "security_rule" {
    for_each = each.value.security_rule

    content {
      name                       = security_rule.value.security_rule_name
      priority                   = security_rule.value.priority
      direction                  = security_rule.value.direction
      access                     = security_rule.value.access
      protocol                   = security_rule.value.protocol
      source_port_range          = security_rule.value.source_port_range
      destination_port_range     = security_rule.value.destination_port_range
      source_address_prefix      = security_rule.value.source_address_prefix
      destination_address_prefix = security_rule.value.destination_address_prefix
    }
  }
}

resource "azurerm_subnet_network_security_group_association" "nsg_assoc" {
  for_each = {
    for k, v in var.subnets : k => v if lookup(v, "nsg_key", null) != null && lookup(v, "nsg_key", "") != ""
  }

  subnet_id                 = azurerm_subnet.subnet[each.key].id
  network_security_group_id = azurerm_network_security_group.nsg[each.value.nsg_key].id
}

resource "azurerm_subnet" "subnet" {
  name                 = var.sub_name
  resource_group_name  = var.rg_name
  virtual_network_name = var.vnet_name
  address_prefixes     = [var.subnet_cidr]

  dynamic "delegation" {
    for_each = var.enable_delegation ? [1] : []
    content {
      name = "delegation"

      service_delegation {
        name    = var.delegation_service
      }
    }
  }
}

resource "azurerm_private_dns_zone" "postgres_private_dns_zone" {
  name                = var.private_dns_zone_name
  resource_group_name = var.rg_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "postgres_vnet_link" {
  name                  = "${var.pg_name}VnetZone.com"
  private_dns_zone_name = azurerm_private_dns_zone.postgres_private_dns_zone.name
  virtual_network_id    = var.virtual_network_id
  resource_group_name   = var.rg_name
}


resource "azurerm_postgresql_flexible_server" "postgres" {
  name                          = var.pg_name
  resource_group_name           = var.rg_name
  location                      = var.rg_location
  version                       = "17"

  sku_name   = "B_Standard_B1ms"
  storage_mb   = 32768
  storage_tier = "P4"

  administrator_login           = var.administrator_login
  administrator_password        = var.administrator_password

  public_network_access_enabled = false
  delegated_subnet_id           = var.delegated_subnet_id
  private_dns_zone_id           = azurerm_private_dns_zone.postgres_private_dns_zone.id
}
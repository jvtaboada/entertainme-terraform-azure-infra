module "resource_group" {
  source = "./modules/resource_group"

  rg_name = local.rg_name
  location = var.azure_region
}

module "virtual_network" {
  source = "./modules/virtual_network"

  vnet_name = local.vnet_name
  location = module.resource_group.rg_location
  rg_name = module.resource_group.rg_name
  vnet_cidr = "10.0.0.0/16"
}

module "default_subnet" {
  source = "./modules/subnet"

  sub_name = local.default_subnet_name
  rg_name = module.resource_group.rg_name
  vnet_name = module.virtual_network.vnet_name
  subnet_cidr = "10.0.0.0/24"
}

module "postgres_subnet" {
  source = "./modules/subnet"

  sub_name = local.postgres_subnet_name
  rg_name = module.resource_group.rg_name
  vnet_name = module.virtual_network.vnet_name
  subnet_cidr = "10.0.1.0/24"

  enable_delegation  = true
  delegation_service = "Microsoft.DBforPostgreSQL/flexibleServers"

  enable_service_endpoints = true
  service_endpoints = "Microsoft.Storage"
}

module "container_apps_subnet" {
  source = "./modules/subnet"

  sub_name = local.container_apps_subnet_name
  rg_name = module.resource_group.rg_name
  vnet_name = module.virtual_network.vnet_name
  subnet_cidr = "10.0.2.0/24"

  enable_delegation  = true
  delegation_service = "Microsoft.App/environments"
}

module "vpn_gateway_subnet" {
  source = "./modules/subnet"

  sub_name = local.vpn_gateway_subnet_name
  rg_name = module.resource_group.rg_name
  vnet_name = module.virtual_network.vnet_name
  subnet_cidr = "10.0.3.0/24"
}


module "postgresql_flexible_server" {
  source = "./modules/postgresql_flexible_server"

  # basics
  rg_name = module.resource_group.rg_name
  pg_name = local.postgres_instance_name
  rg_location = module.resource_group.rg_location

  # compute / storage > all in module

  # auth
  administrator_login           = var.admin_username
  administrator_password        = var.admin_password

  # network
  virtual_network_id = module.virtual_network.vnet_id
  delegated_subnet_id = module.postgres_subnet.subnet_id
  private_dns_zone_name = local.private_dns_zone_name
}

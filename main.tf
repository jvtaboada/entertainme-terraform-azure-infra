module "resource_group" {
  source = "./modules/resource_group"

  rg_name = local.rg_name
  location = var.azure_region
}

module "virtual_network" {
  source = "./modules/virtual_network"

  vnet_name = local.vnet_name
  location = var.azure_region
  rg_name = local.rg_name
  vnet_cidr = "10.0.0.0/16"
}

module "default_subnet" {
  source = "./modules/subnet"

  sub_name = local.default_subnet_name
  rg_name = local.rg_name
  vnet_name = local.vnet_name
  subnet_cidr = "10.0.0.0/24"
}

module "postgres_subnet" {
  source = "./modules/subnet"

  sub_name = local.postgres_subnet_name
  rg_name = local.rg_name
  vnet_name = local.vnet_name
  subnet_cidr = "10.0.1.0/24"

  enable_delegation  = true
  delegation_service = "Microsoft.DBforPostgreSQL/flexibleServers"
}

module "container_apps_subnet" {
  source = "./modules/subnet"

  sub_name = local.container_apps_subnet_name
  rg_name = local.rg_name
  vnet_name = local.vnet_name
  subnet_cidr = "10.0.2.0/24"

  enable_delegation  = true
  delegation_service = "Microsoft.App/environments"
}

module "vpn_gateway_subnet" {
  source = "./modules/subnet"

  sub_name = local.vpn_gateway_subnet_name
  rg_name = local.rg_name
  vnet_name = local.vnet_name
  subnet_cidr = "10.0.3.0/24"
}
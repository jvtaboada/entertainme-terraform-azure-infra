locals {
    rg_name = "rg-entertainme-${var.environment}"
    vnet_name = "vnet-entertainme-${var.environment}"

    default_subnet_name = "subnet1"
    postgres_subnet_name = "postgres-subnet"
    vpn_gateway_subnet_name = "GatewaySubnet"
    container_apps_subnet_name = "container-apps-subnet"
}
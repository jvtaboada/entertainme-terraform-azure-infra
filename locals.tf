locals {
    rg_name = "rg-entertainme-${var.environment}"
    vnet_name = "vnet-entertainme-${var.environment}"

    default_subnet_name = "subnet1"
    postgres_subnet_name = "postgres-subnet"
    vpn_gateway_subnet_name = "GatewaySubnet"
    container_apps_subnet_name = "container-apps-subnet"

    postgres_instance_name = "psql-entertainme-${var.environment}"
    private_dns_zone_name = "psql-entertainme.postgres.database.azure.com"
}
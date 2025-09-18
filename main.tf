module "create_rg" {
  source = "./modules/resource_group"

  rg_name = local.rg_name
  location = var.azure_region
}
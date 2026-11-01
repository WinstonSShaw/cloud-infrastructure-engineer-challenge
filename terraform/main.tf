locals {
  name          = "${var.project}-${var.environment}"
  database_port = 5432
}

module "network" {
  source = "./modules/network"

  name               = local.name
  vpc_cidr           = var.vpc_cidr
  az_count           = var.az_count
  single_nat_gateway = var.single_nat_gateway
  database_port      = local.database_port
  log_retention_days = var.log_retention_days
}

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

module "database" {
  source = "./modules/database"

  name               = "${local.name}-postgres"
  subnet_ids         = module.network.database_subnet_ids
  security_group_ids = [module.network.database_security_group_id]
  port               = local.database_port

  engine_version        = var.db_engine_version
  instance_class        = var.db_instance_class
  multi_az              = var.db_multi_az
  backup_retention_days = var.db_backup_retention_days
  deletion_protection   = var.db_deletion_protection
  skip_final_snapshot   = var.db_skip_final_snapshot
  log_retention_days    = var.log_retention_days
}

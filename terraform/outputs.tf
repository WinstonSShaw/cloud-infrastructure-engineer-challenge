output "vpc_id" {
  description = "ID of the VPC."
  value       = module.network.vpc_id
}

output "nat_gateway_public_ips" {
  description = "Egress public IPs of the private subnets."
  value       = module.network.nat_gateway_public_ips
}

output "database_endpoint" {
  description = "Private endpoint of the PostgreSQL instance (only reachable from inside the VPC)."
  value       = "${module.database.address}:${module.database.port}"
}

output "database_secret_arn" {
  description = "Secrets Manager secret with the database master credentials (managed by RDS)."
  value       = module.database.master_user_secret_arn
}

output "lambda_function_name" {
  description = "Name of the Info Lambda function."
  value       = module.lambda.function_name
}

output "lambda_log_group" {
  description = "CloudWatch log group with the Lambda logs."
  value       = module.lambda.log_group_name
}

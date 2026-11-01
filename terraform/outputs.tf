output "vpc_id" {
  description = "ID of the VPC."
  value       = module.network.vpc_id
}

output "nat_gateway_public_ips" {
  description = "Egress public IPs of the private subnets."
  value       = module.network.nat_gateway_public_ips
}

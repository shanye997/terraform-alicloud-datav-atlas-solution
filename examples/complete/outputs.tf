output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.datav_for_atlas.vpc_id
}

output "vswitch_id" {
  description = "The ID of the VSwitch"
  value       = module.datav_for_atlas.vswitch_id
}

output "db_instance_id" {
  description = "The ID of the PostgreSQL instance"
  value       = module.datav_for_atlas.db_instance_id
}

output "pg_public_connection_string" {
  description = "PostgreSQL public connection string"
  value       = module.datav_for_atlas.pg_public_connection_string
}

output "account_name" {
  description = "Database account name"
  value       = module.datav_for_atlas.account_name
}

output "database_name" {
  description = "Database name"
  value       = module.datav_for_atlas.database_name
}

output "database_port" {
  description = "Database connection port"
  value       = module.datav_for_atlas.database_port
}
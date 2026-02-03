# ------------------------------------------------------------------------------
# Module Output Values
#
# This file defines the values that this module returns to the calling configuration
# These outputs can be referenced by other Terraform configurations or displayed to users after apply
# ------------------------------------------------------------------------------

# Output VPC ID
output "vpc_id" {
  description = "The ID of the VPC"
  value       = alicloud_vpc.vpc.id
}

# Output VPC CIDR block
output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = alicloud_vpc.vpc.cidr_block
}

# Output VSwitch ID
output "vswitch_id" {
  description = "The ID of the VSwitch"
  value       = alicloud_vswitch.vswitch.id
}

# Output PostgreSQL instance ID
output "db_instance_id" {
  description = "The ID of the PostgreSQL instance"
  value       = alicloud_db_instance.db_instance.id
}

# Output PostgreSQL instance connection string
output "db_connection_string" {
  description = "The connection string of the PostgreSQL instance"
  value       = alicloud_db_instance.db_instance.connection_string
}

# Output PostgreSQL public connection string
output "pg_public_connection_string" {
  description = "PostgreSQL public connection string"
  value       = alicloud_db_connection.public.connection_string
}

# Output database account name
output "account_name" {
  description = "Database account name"
  value       = alicloud_rds_account.account.account_name
}

# Output database account password
output "account_password" {
  description = "Database account password"
  value       = var.account_password
  sensitive   = true
}

# Output database name
output "database_name" {
  description = "Database name"
  value       = alicloud_db_database.db_database.data_base_name
}

# Output database port
output "database_port" {
  description = "Database connection port"
  value       = alicloud_db_connection.public.port
}
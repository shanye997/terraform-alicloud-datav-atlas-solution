# ------------------------------------------------------------------------------
# Core Resource Definitions
#
# This file contains the core infrastructure resources for the module
# The code here is responsible for creating and configuring all cloud resources
# based on input variables
# ------------------------------------------------------------------------------

# Create VPC
resource "alicloud_vpc" "vpc" {
  vpc_name   = var.vpc_config.vpc_name
  cidr_block = var.vpc_config.cidr_block
}

# Create VSwitch
resource "alicloud_vswitch" "vswitch" {
  vpc_id       = alicloud_vpc.vpc.id
  cidr_block   = var.vswitch_config.cidr_block
  vswitch_name = var.vswitch_config.vswitch_name
  zone_id      = var.vswitch_config.zone_id
}

# Create PostgreSQL instance
resource "alicloud_db_instance" "db_instance" {
  engine                   = var.database_config.engine
  engine_version           = var.database_config.engine_version
  instance_storage         = var.database_config.instance_storage
  instance_type            = var.database_config.instance_type
  instance_charge_type     = var.database_config.instance_charge_type
  instance_name            = var.database_config.instance_name
  zone_id                  = var.vswitch_config.zone_id
  vswitch_id               = alicloud_vswitch.vswitch.id
  db_instance_storage_type = var.database_config.db_instance_storage_type
  category                 = var.database_config.category
  security_ips             = var.database_config.security_ips
}

# Create public connection
resource "alicloud_db_connection" "public" {
  instance_id       = alicloud_db_instance.db_instance.id
  connection_prefix = var.database_config.connection_prefix
  port              = var.database_config.port
}

# Create RDS account
resource "alicloud_rds_account" "account" {
  db_instance_id   = alicloud_db_instance.db_instance.id
  account_type     = var.database_config.account_type
  account_password = var.account_password
  account_name     = var.database_config.account_name
}

# Create RDS database
resource "alicloud_db_database" "db_database" {
  instance_id    = alicloud_db_instance.db_instance.id
  character_set  = var.database_config.character_set
  data_base_name = var.database_config.database_name
}

# Set RDS account privileges
resource "alicloud_db_account_privilege" "privilege" {
  instance_id  = alicloud_db_instance.db_instance.id
  account_name = alicloud_rds_account.account.account_name
  privilege    = var.database_config.privilege
  db_names     = [alicloud_db_database.db_database.data_base_name]
}
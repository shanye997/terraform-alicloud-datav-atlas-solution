# Configure the Alibaba Cloud Provider
provider "alicloud" {
  region = var.region
}

# Data source to get available zones for PostgreSQL
data "alicloud_db_zones" "default" {
  engine                   = "PostgreSQL"
  engine_version           = "17.0"
  instance_charge_type     = "PostPaid"
  category                 = "Basic"
  db_instance_storage_type = "cloud_essd"
}

# Call the datav-for-atlas module
module "datav_for_atlas" {
  source = "../../"

  vpc_config = {
    cidr_block = var.vpc_cidr_block
    vpc_name   = var.vpc_name
  }

  vswitch_config = {
    cidr_block   = var.vswitch_cidr_block
    zone_id      = data.alicloud_db_zones.default.zones[0].id
    vswitch_name = var.vswitch_name
  }

  account_password = var.db_password

  database_config = {
    engine                   = "PostgreSQL"
    engine_version           = "17.0"
    instance_storage         = "50"
    instance_type            = var.db_instance_class
    instance_charge_type     = "Postpaid"
    db_instance_storage_type = "cloud_essd"
    category                 = "Basic"
    security_ips             = ["47.99.0.0/16", "192.168.0.0/16"]
    port                     = "5432"
    account_type             = "Super"
    account_name             = var.rds_db_user
    character_set            = "utf8"
    database_name            = var.db_name
    privilege                = "DBOwner"
    instance_name            = var.instance_name
    connection_prefix        = var.connection_prefix
  }
}
# ------------------------------------------------------------------------------
# Module Input Variables
#
# This file defines all configurable input variables for this Terraform module
# Each variable includes detailed descriptions to help users configure the module correctly
# ------------------------------------------------------------------------------

variable "vpc_config" {
  description = "Configuration for VPC. The attributes 'cidr_block' and 'vpc_name' are required."
  type = object({
    cidr_block = string
    vpc_name   = string
  })
}

variable "vswitch_config" {
  description = "Configuration for VSwitch. The attributes 'cidr_block', 'zone_id', and 'vswitch_name' are required."
  type = object({
    cidr_block   = string
    zone_id      = string
    vswitch_name = string
  })
}

variable "account_password" {
  description = "Password for the database account."
  type        = string
  sensitive   = true
}

variable "database_config" {
  description = "Configuration for PostgreSQL database instance. The attributes 'account_name', 'database_name', 'instance_name', 'connection_prefix' are required."
  type = object({
    engine                   = optional(string, "PostgreSQL")
    engine_version           = optional(string, "17.0")
    instance_storage         = optional(string, "50")
    instance_type            = optional(string, "pg.n4.2c.1m")
    instance_charge_type     = optional(string, "Postpaid")
    db_instance_storage_type = optional(string, "cloud_essd")
    category                 = optional(string, "Basic")
    security_ips             = optional(list(string), ["47.99.0.0/16", "192.168.0.0/16"])
    port                     = optional(string, "5432")
    account_type             = optional(string, "Super")
    account_name             = string
    character_set            = optional(string, "utf8")
    database_name            = string
    privilege                = optional(string, "DBOwner")
    instance_name            = string
    connection_prefix        = string
  })
}
variable "region" {
  description = "The Alibaba Cloud region where resources will be created"
  type        = string
  default     = "cn-shenzhen"
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "192.168.0.0/16"

  validation {
    condition     = can(cidrhost(var.vpc_cidr_block, 0))
    error_message = "The vpc_cidr_block must be a valid IPv4 CIDR block."
  }
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
  default     = "datav-vpc-example"
}

variable "vswitch_cidr_block" {
  description = "CIDR block for the VSwitch"
  type        = string
  default     = "192.168.1.0/24"

  validation {
    condition     = can(cidrhost(var.vswitch_cidr_block, 0))
    error_message = "The vswitch_cidr_block must be a valid IPv4 CIDR block."
  }
}

variable "vswitch_name" {
  description = "Name of the VSwitch"
  type        = string
  default     = "datav-vswitch-example"
}

variable "db_instance_class" {
  description = "PostgreSQL instance class"
  type        = string
  default     = "pg.n4.2c.1m"
}

variable "rds_db_user" {
  description = "RDS database account name"
  type        = string
  default     = "test_user"

  validation {
    condition     = length(var.rds_db_user) >= 2 && length(var.rds_db_user) <= 16
    error_message = "The rds_db_user must be between 2 and 16 characters."
  }
}

variable "db_name" {
  description = "RDS database name"
  type        = string
  default     = "food_test"

  validation {
    condition     = length(var.db_name) >= 2 && length(var.db_name) <= 64
    error_message = "The db_name must be between 2 and 64 characters."
  }
}

variable "db_password" {
  description = "RDS database password"
  type        = string
  sensitive   = true

  validation {
    condition     = length(var.db_password) >= 8 && length(var.db_password) <= 32
    error_message = "The db_password must be between 8 and 32 characters."
  }
}

variable "instance_name" {
  description = "Name of the PostgreSQL instance"
  type        = string
  default     = "datav-instance"
}

variable "connection_prefix" {
  description = "Prefix for the database connection"
  type        = string
  default     = "datav-pg-con"
}
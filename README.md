Alibaba Cloud DataV for Atlas Solution Terraform Module

# terraform-alicloud-datav-atlas-solution

English | [简体中文](https://github.com/alibabacloud-automation/terraform-alicloud-datav-atlas-solution/blob/main/README-CN.md)

Terraform module which creates a complete DataV for Atlas solution on Alibaba Cloud. This example is used to implement solution [Unified spatio-temporal decision-making to unlock the value of spatial data](https://www.aliyun.com/solution/tech-solution/datav-for-atlas), which involves the creation and deployment of resources such as Virtual Private Cloud (VPC), Virtual Switch (VSwitch),RDS Database (RDS) for spatial data analysis and visualization.

## Usage

This module provides a complete infrastructure setup for DataV Atlas solution, enabling unified spatio-temporal decision-making to unlock the value of spatial data.

```terraform
data "alicloud_db_zones" "default" {
  engine                   = "PostgreSQL"
  engine_version           = "17.0"
  instance_charge_type     = "PostPaid"
  category                 = "Basic"
  db_instance_storage_type = "cloud_essd"
}

module "datav_atlas_solution" {
  source = "alibabacloud-automation/datav-atlas-solution/alicloud"

  vpc_config = {
    cidr_block = "192.168.0.0/16"
    vpc_name   = "datav-vpc"
  }

  vswitch_config = {
    cidr_block   = "192.168.1.0/24"
    zone_id      = data.alicloud_db_zones.default.zones[0].id
    vswitch_name = "datav-vswitch"
  }

  database_config = {
    account_name      = "datav_user"
    account_password  = "YourSecurePassword123!"
    database_name     = "spatial_data"
    instance_name     = "datav-instance"
    connection_prefix = "datav-pg-con"
  }
}
```

## Examples

* [Complete Example](https://github.com/alibabacloud-automation/terraform-alicloud-datav-atlas-solution/tree/main/examples/complete)

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | >= 1.212.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | >= 1.212.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [alicloud_db_account_privilege.privilege](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/db_account_privilege) | resource |
| [alicloud_db_connection.public](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/db_connection) | resource |
| [alicloud_db_database.db_database](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/db_database) | resource |
| [alicloud_db_instance.db_instance](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/db_instance) | resource |
| [alicloud_rds_account.account](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/rds_account) | resource |
| [alicloud_vpc.vpc](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/vpc) | resource |
| [alicloud_vswitch.vswitch](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/vswitch) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_database_config"></a> [database\_config](#input\_database\_config) | Configuration for PostgreSQL database instance. The attributes 'account\_name', 'account\_password', 'database\_name' are required. | <pre>object({<br/>    engine                   = optional(string, "PostgreSQL")<br/>    engine_version           = optional(string, "17.0")<br/>    instance_storage         = optional(string, "50")<br/>    instance_type            = optional(string, "pg.n4.2c.1m")<br/>    instance_charge_type     = optional(string, "Postpaid")<br/>    db_instance_storage_type = optional(string, "cloud_essd")<br/>    category                 = optional(string, "Basic")<br/>    security_ips             = optional(list(string), ["47.99.0.0/16", "192.168.0.0/16"])<br/>    port                     = optional(string, "5432")<br/>    account_type             = optional(string, "Super")<br/>    account_name             = string<br/>    account_password         = string<br/>    character_set            = optional(string, "utf8")<br/>    database_name            = string<br/>    privilege                = optional(string, "DBOwner")<br/>    instance_name            = optional(string, null)<br/>    connection_prefix        = optional(string, null)<br/>  })</pre> | n/a | yes |
| <a name="input_vpc_config"></a> [vpc\_config](#input\_vpc\_config) | Configuration for VPC. The attribute 'cidr\_block' is required. | <pre>object({<br/>    cidr_block = string<br/>    vpc_name   = optional(string, null)<br/>  })</pre> | n/a | yes |
| <a name="input_vswitch_config"></a> [vswitch\_config](#input\_vswitch\_config) | Configuration for VSwitch. The attributes 'cidr\_block' and 'zone\_id' are required. | <pre>object({<br/>    cidr_block   = string<br/>    zone_id      = string<br/>    vswitch_name = optional(string, null)<br/>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_account_name"></a> [account\_name](#output\_account\_name) | Database account name |
| <a name="output_account_password"></a> [account\_password](#output\_account\_password) | Database account password |
| <a name="output_database_name"></a> [database\_name](#output\_database\_name) | Database name |
| <a name="output_database_port"></a> [database\_port](#output\_database\_port) | Database connection port |
| <a name="output_db_connection_string"></a> [db\_connection\_string](#output\_db\_connection\_string) | The connection string of the PostgreSQL instance |
| <a name="output_db_instance_id"></a> [db\_instance\_id](#output\_db\_instance\_id) | The ID of the PostgreSQL instance |
| <a name="output_pg_public_connection_string"></a> [pg\_public\_connection\_string](#output\_pg\_public\_connection\_string) | PostgreSQL public connection string |
| <a name="output_vpc_cidr_block"></a> [vpc\_cidr\_block](#output\_vpc\_cidr\_block) | The CIDR block of the VPC |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | The ID of the VPC |
| <a name="output_vswitch_id"></a> [vswitch\_id](#output\_vswitch\_id) | The ID of the VSwitch |
<!-- END_TF_DOCS -->

## Submit Issues

If you have any problems when using this module, please opening
a [provider issue](https://github.com/aliyun/terraform-provider-alicloud/issues/new) and let us know.

**Note:** There does not recommend opening an issue on this repo.

## Authors

Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com).

## License

MIT Licensed. See LICENSE for full details.

## Reference

* [Terraform-Provider-Alicloud Github](https://github.com/aliyun/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs)
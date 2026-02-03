# Complete Example

This example demonstrates the complete usage of the DataV for Atlas module.

## Overview

This example creates a complete DataV for Atlas solution including:

- VPC (Virtual Private Cloud) with configurable CIDR block
- VSwitch (Virtual Switch) in specified availability zone
- PostgreSQL RDS instance with PostGIS extension support
- Database account with proper privileges
- Database for spatial data storage
- Public connection for external access

## Prerequisites

- Terraform >= 1.0
- Alibaba Cloud account with appropriate permissions
- Alibaba Cloud CLI configured (optional)

## Usage

1. Clone this repository
2. Navigate to this example directory
3. Copy `terraform.tfvars.example` to `terraform.tfvars` and customize the values
4. Run the following commands:

```bash
terraform init
terraform plan
terraform apply
```

## Example terraform.tfvars

```hcl
region                = "cn-hangzhou"
vpc_cidr_block       = "192.168.0.0/16"
vpc_name             = "datav-vpc-example"
vswitch_cidr_block   = "192.168.1.0/24"
vswitch_name         = "datav-vswitch-example"
db_instance_class    = "pg.n4.2c.1m"
rds_db_user          = "test_user"
db_name              = "spatial_data"
db_password          = "YourSecurePassword123!"
```

## Configuration Details

### Network Configuration
- **VPC CIDR**: Default is `192.168.0.0/16`, can be customized
- **VSwitch CIDR**: Default is `192.168.1.0/24`, must be within VPC CIDR
- **Zone**: Automatically selected based on PostgreSQL availability

### Database Configuration
- **Engine**: PostgreSQL 17.0 with PostGIS support
- **Instance Class**: `pg.n4.2c.1m` (2 vCPUs, 1GB memory)
- **Storage**: 50GB cloud ESSD
- **Billing**: PostPaid (pay-as-you-go)
- **Security**: Configured IP whitelist for access control

## Outputs

After successful deployment, you will get:

- `vpc_id`: The ID of the created VPC
- `vswitch_id`: The ID of the created VSwitch
- `db_instance_id`: The ID of the PostgreSQL instance
- `pg_public_connection_string`: The public connection string for PostgreSQL
- `account_name`: The database account name
- `database_name`: The database name
- `database_port`: The database connection port (default: 5432)

## Security Considerations

- The database password is marked as sensitive and will not be displayed in logs
- Security groups are configured to allow access from specified IP ranges
- Use strong passwords (minimum 8 characters, maximum 32 characters)
- Consider using Alibaba Cloud KMS for password management in production

## Cost Estimation

This example will create billable resources:
- PostgreSQL RDS instance (PostPaid billing)
- VPC and VSwitch (free tier available)
- Public IP for database connection (minimal cost)

## Clean Up

To destroy the resources created by this example:

```bash
terraform destroy
```

**Warning**: This will permanently delete all resources. Make sure to backup any important data before destroying.

## Troubleshooting

### Common Issues

1. **Zone Availability**: If the selected zone doesn't support PostgreSQL, the data source will automatically find an available zone.

2. **CIDR Conflicts**: Ensure VSwitch CIDR is within VPC CIDR and doesn't conflict with existing networks.

3. **Instance Class**: If the specified instance class is not available, check the Alibaba Cloud console for available options in your region.

4. **Password Requirements**: Ensure the password meets Alibaba Cloud RDS requirements (8-32 characters, containing letters, numbers, and special characters).

## Next Steps

After deployment, you can:
1. Connect to the PostgreSQL instance using the provided connection string
2. Install PostGIS extension for spatial data support
3. Import your spatial datasets
4. Configure DataV to visualize your spatial data

## Support

For issues related to this module, please check:
- [Terraform Alibaba Cloud Provider Documentation](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs)
- [Alibaba Cloud RDS Documentation](https://www.alibabacloud.com/help/product/26090.htm)
- [DataV Documentation](https://www.alibabacloud.com/help/product/30364.htm)
# ECS Cluster with Load Balancer (full)

## Requirements

| Name | Version |
|------|---------|
| terraform | ~> 0.13 |
| aws | ~> 2.54 |
| random | ~> 2.3 |

## Providers

| Name | Version |
|------|---------|
| aws | ~> 2.54 |
| random | ~> 2.3 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| environ | Environment of the application. It will be used to name the resources of this module. | `string` | `"beta"` | no |
| name | Name of the application. It will be used to name the resources of this module. | `string` | `"my-app"` | no |
| public\_subnet\_ids | (Optional) A list of Public Subnet IDs. It is required if "create\_load\_balancer" is "true". | `list(string)` | <pre>[<br>  "subnet-002b5423",<br>  "subnet-0e0dbd33"<br>]</pre> | no |
| tags | (Optional) Key-value map of resource tags. | `map(string)` | `{}` | no |
| vpc\_id | (Optional) The VPC ID. It is required if "create\_load\_balancer" is "true". | `string` | `"vpc-093bee94"` | no |

## Outputs

| Name | Description |
|------|-------------|
| my\_app\_dns | DNS name of the AWS ALB (Application Load Balancer). |

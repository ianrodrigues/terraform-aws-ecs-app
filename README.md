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
| capacity\_provider\_strategies | (Optional) A list of capacity provider strategies. | <pre>list(object({<br>    capacity_provider = string<br>    weight            = number<br>    base              = number<br>  }))</pre> | `[]` | no |
| capacity\_providers | (Optional) Key-value map of resource tags. | `list(string)` | <pre>[<br>  "FARGATE",<br>  "FARGATE_SPOT"<br>]</pre> | no |
| create\_load\_balancer | (Optional) Whether to create an AWS ALB (Application Load Balancer) as part of the application. | `bool` | `true` | no |
| enable\_container\_insights | (Optional) Whether to enable AWS ECS Container Insights. | `bool` | `true` | no |
| environ | Environment of the application. It will be used to name the resources of this module. | `string` | n/a | yes |
| name | Name of the application. It will be used to name the resources of this module. | `string` | n/a | yes |
| public\_subnet\_ids | (Optional) A list of Public Subnet IDs. It is required if "create\_load\_balancer" is "true". | `list(string)` | `[]` | no |
| tags | (Optional) Key-value map of resource tags. | `map(string)` | `{}` | no |
| vpc\_id | (Optional) The VPC ID. It is required if "create\_load\_balancer" is "true". | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| this\_app\_security\_group\_id | ID of the application Security Group. |
| this\_cluster | Name of the ECS cluster. |
| this\_lb\_arn | ARN of the AWS ALB (Application Load Balancer). |
| this\_lb\_dns | DNS name of the AWS ALB (Application Load Balancer). |

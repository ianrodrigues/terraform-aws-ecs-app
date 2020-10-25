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
| environ | n/a | `string` | `"beta"` | no |
| name | n/a | `string` | `"my-app"` | no |
| public\_subnet\_ids | n/a | `list(string)` | <pre>[<br>  "subnet-002b5423",<br>  "subnet-0e0dbd33"<br>]</pre> | no |
| tags | n/a | `map(string)` | `{}` | no |
| vpc\_id | n/a | `string` | `"vpc-093bee94"` | no |

## Outputs

| Name | Description |
|------|-------------|
| my\_app\_dns | n/a |

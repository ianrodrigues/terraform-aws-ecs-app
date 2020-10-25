# ECS Cluster (only)

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
| tags | (Optional) Key-value map of resource tags. | `map(string)` | `{}` | no |

## Outputs

No output.

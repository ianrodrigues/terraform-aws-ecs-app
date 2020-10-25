variable "name" {
  type        = string
  default     = "my-app"
  description = "Name of the application. It will be used to name the resources of this module."

  validation {
    condition     = can(regex("^[a-z\\-]+[a-z]$", var.name))
    error_message = "\"name\" can only contains lower case letter and hyphens."
  }
}

variable "environ" {
  type        = string
  default     = "beta"
  description = "Environment of the application. It will be used to name the resources of this module."

  validation {
    condition     = can(regex("^[a-z\\-]+[a-z]$", var.environ))
    error_message = "\"environ\" can only contains lower case letter and hyphens."
  }
}

variable "vpc_id" {
  type        = string
  default     = "vpc-093bee94"
  description = "(Optional) The VPC ID. It is required if \"create_load_balancer\" is \"true\"."
}

variable "public_subnet_ids" {
  type        = list(string)
  default     = ["subnet-002b5423", "subnet-0e0dbd33"]
  description = "(Optional) A list of Public Subnet IDs. It is required if \"create_load_balancer\" is \"true\"."
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "(Optional) Key-value map of resource tags."
}

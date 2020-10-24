variable "name" {
  type        = string
  description = "Name of the application. It will be used to name the resources of this module."

  validation {
    condition     = can(regex("^[a-z\\-]+[a-z]$"), var.name)
    error_message = "\"name\" can only contains lower case letter and hyphens."
  }
}

variable "environ" {
  type        = string
  description = "Environment of the application. It will be used to name the resources of this module."

  validation {
    condition     = can(regex("^[a-z\\-]+[a-z]$"), var.environ)
    error_message = "\"environ\" can only contains lower case letter and hyphens."
  }
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "(Optional) Key-value map of resource tags."
}

variable "capacity_providers" {
  type        = list(string)
  default     = ["FARGATE", "FARGATE_SPOT"]
  description = "(Optional) Key-value map of resource tags."
}

variable "capacity_provider_strategies" {
  type = list(object({
    capacity_provider = string
    weight            = number
    base              = number
  }))

  default     = []
  description = "(Optional) A list of capacity provider strategies."
}

variable "enable_container_insights" {
  type        = bool
  default     = true
  description = "(Optional) Whether to enable AWS ECS Container Insights."
}

variable "create_load_balancer" {
  type        = bool
  default     = true
  description = "(Optional) Whether to create an AWS ALB (Application Load Balancer) as part of the application."
}

variable "vpc_id" {
  type        = string
  default     = ""
  description = "(Optional) The VPC ID. It is required if \"create_load_balancer\" is \"true\"."
}

variable "public_subnet_ids" {
  type        = list(string)
  default     = []
  description = "(Optional) A list of Public Subnet IDs. It is required if \"create_load_balancer\" is \"true\"."
}

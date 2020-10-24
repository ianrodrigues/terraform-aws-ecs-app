variable "name" {
  type = string
}

variable "environ" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "capacity_providers" {
  type    = list(string)
  default = ["FARGATE", "FARGATE_SPOT"]
}

variable "capacity_provider_strategies" {
  type = list(object({
    capacity_provider = string
    weight            = number
    base              = number
  }))

  default = []
}

variable "create_load_balancer" {
  type    = bool
  default = true
}

variable "vpc_id" {
  type    = string
  default = ""
}

variable "public_subnet_ids" {
  type    = list(string)
  default = []
}

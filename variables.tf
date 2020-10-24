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

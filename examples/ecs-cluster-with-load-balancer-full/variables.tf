variable "name" {
  type    = string
  default = "my-app"
}

variable "environ" {
  type    = string
  default = "beta"
}

variable "vpc_id" {
  type    = string
  default = "vpc-093bee94"
}

variable "public_subnet_ids" {
  type    = list(string)
  default = ["subnet-002b5423", "subnet-0e0dbd33"]
}

variable "tags" {
  type    = map(string)
  default = {}
}

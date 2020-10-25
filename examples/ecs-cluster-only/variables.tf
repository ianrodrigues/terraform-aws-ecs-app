variable "name" {
  type    = string
  default = "my-app"
}

variable "environ" {
  type    = string
  default = "beta"
}

variable "tags" {
  type    = map(string)
  default = {}
}

terraform {
  required_version = ">= 0.12.20"
}

variable "COUNT" {
  type = string
}

resource "null_resource" "null" {
  count=tonumber(var.COUNT)
}

resource "null_resource" "null2" {
}

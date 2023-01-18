terraform {
  required_version = ">= 0.12.20"
}

resource "null_resource" "null" {
  count=tonumber(var.COUNT)
}

resource "null_resource" "null2" {
}

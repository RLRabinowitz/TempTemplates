terraform {
  required_version = ">= 0.12.20"
}

resource "null_resource" "null" {
}

resource "null_resource" "null2" {
}

resource "null_resource" "null3" {
}

resource "null_resource" "null5" {
}

output "null_id" {
  value = null_resource.null.id
}

output "null_id_2" {
  value = null_resource.null3.id
}

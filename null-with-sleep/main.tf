terraform {
  required_version = ">= 0.12.20"
}

resource "null_resource" "null" {
}

resource "null_resource" "null23" {
}

output "null_id" {
  value = null_resource.null.id
}

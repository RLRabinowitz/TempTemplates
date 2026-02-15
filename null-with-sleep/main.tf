terraform {
  required_version = ">= 0.12.20"
}

resource "null_resource" "null" {
}

output "null_id" {
  value = null_resource.null.id
}

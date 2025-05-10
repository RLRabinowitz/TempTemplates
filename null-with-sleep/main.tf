terraform {
  required_version = ">= 0.12.20"
}

resource "null_resource" "null5" {
}

resource "null_resource" "null3" {
}

output "null_id" {
  value = null_resource.null.id
}

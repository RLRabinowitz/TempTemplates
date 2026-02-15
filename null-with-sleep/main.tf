terraform {
  required_version = ">= 0.12.20"
}

resource "null_resource" "null" {
}

resource "null_resource" "null2" {
  triggers = {
    id = null_resource.null.id
  } 
}

output "null_id" {
  value = null_resource.null.id
}

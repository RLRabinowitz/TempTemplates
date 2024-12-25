terraform {
  required_version = ">= 0.12.20"
}

resource "null_resource" "null" {
}

resource "null_resource" "null2" {
}

output "myoutput23" {
  value = null_resource.null.id
}

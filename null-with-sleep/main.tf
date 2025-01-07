terraform {
  required_version = ">= 0.12.20"
}

resource "null_resource" "null" {
}

resource "null_resource" "null2" {
  triggers = { a = { k = null_resource.null.id } }
}

output "myoutput23" {
  value = null_resource.null.id
}

output "myoutput232" {
  value = null_resource.null.id
}

output "myoutput2323" {
  value = null_resource.null.id
}

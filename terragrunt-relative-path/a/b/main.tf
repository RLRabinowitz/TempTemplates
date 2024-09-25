resource "null_resource" "nully" {
}

output "my-output" {
  value = null_resource.nully.id
}

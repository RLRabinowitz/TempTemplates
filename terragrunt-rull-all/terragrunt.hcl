generate "null_resource" {
  path = "tg.main.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
resource "null_resource" "null" {
}
resource "null_resource" "null2" {
  triggers = { b = null_resource.null.id }
}

output "v" {
  value = null_resource.null.id
}

output "v2" {
  value = null_resource.null2.id
}

output "complex" {
  value = { a = { k = null_resource.null2.triggers } }
}
EOF
}

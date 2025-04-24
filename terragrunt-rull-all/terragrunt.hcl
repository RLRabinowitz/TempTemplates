generate "null_resource" {
  path = "tg.main.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
resource "null_resource" "null" {
}
resource "null_resource" "null2" {
}
output "a" {
  value = null_resource.null.id
}
EOF
}

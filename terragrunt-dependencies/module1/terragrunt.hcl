generate "null_resource" {
  path = "module1.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
resource "null_resource" "module1" {

}
EOF
}

dependency "module2" {
  config_path = "../module2"

  mock_outputs = {
    my_value = "module1"
  }
}

inputs = {
  my_value = dependency.module2.outputs.my_value
}

generate "output" {
  path = "output.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
output "my_value" {
  value = var.my_value
}
EOF
}

generate "variables" {
  path = "variables.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
variable "my_value" {}
EOF
}

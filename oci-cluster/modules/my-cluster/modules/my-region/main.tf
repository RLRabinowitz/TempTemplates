variable "region" {
  type = string
}

resource "null_resource" "this" {
  triggers = {
    region = var.region
  }
}

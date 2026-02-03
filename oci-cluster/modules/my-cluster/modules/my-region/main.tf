variable "region" {
  type = string
}

resource "null_resource" "this" {
  for_each = toset(["a", "b", "c"])

  triggers = {
    region = var.region
    key    = each.key
  }
}

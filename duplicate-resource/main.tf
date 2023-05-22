variable "count" {
}
resource "null_resource" "name" {
  count = 1
  triggers = {
    timestamp = "${timestamp()}"
  }
}

resource "null_resource" "name" {

  count = var.count
  triggers = {
    timestamp = "${timestamp()}-2"
  }
}

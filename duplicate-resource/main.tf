
resource "null_resource" "name" {
  count = 1
  triggers = {
    timestamp = "${timestamp()}"
  }
}

resource "null_resource" "name2" {
  count = 2
  triggers = {
    timestamp = "${timestamp()}-2"
  }
}
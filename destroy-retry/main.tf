resource "null_resource" "example1" {
  depends_on = [null_resource.example2]
}

resource "null_resource" "example2" {
  provisioner "local-exec" {
    when    = "destroy"
    command = "exit 1"
  }
}


resource "null_resource" "cluster" {
  variable "name" {}
  triggers = {
    cluster_instance_ids = "${var.name}-web_app"
  }
}
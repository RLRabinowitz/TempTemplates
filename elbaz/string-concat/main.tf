
resource "null_resource" "cluster" {
  triggers = {
    cluster_instance_ids = "${var.name}-web_app"
  }
}
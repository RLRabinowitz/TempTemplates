
variable "var" {
  default = ""
}

resource "null_resource" "cluster" {
 triggers = {
    cluster_instance_ids = var.var+"-web_app"
  }
}
resource "null_resource" "nully" {
  spec {
    replicas = true ? 0 : (false ? 1 : 2)
    strategy {
      type = "whatever"
    }
  }
}

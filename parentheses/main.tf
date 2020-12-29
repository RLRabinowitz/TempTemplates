resource "kubernetes_deployment" "k" {
  spec {
    replicas = true ? 0 : (false ? 1 : 2)
    strategy {
      type = "whatever"
    }
  }
}

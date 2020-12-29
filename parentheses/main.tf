resource "google_pubsub_topic" "audit_topic" {
  metadata {
    name = "terraform-example"
  }
  spec {
    replicas = var.pre_migration_scale_down_mode_enabled ? 0 : (var.minimal_setup_enabled ? local.minimal_setup_replicas : 1)
    strategy {
      type = local.kubernetes_deployment_strategy_rolling_update
    }
  }
}

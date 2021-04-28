terraform {
  required_version = ">= 0.12.20"
}

# This resource will destroy (potentially immediately) after null_resource.next
resource "null_resource" "previous" {}

resource "time_sleep" "wait_120_seconds" {
  depends_on = [null_resource.previous]

  create_duration = "120s"
}

# This resource will create (at least) 120 seconds after null_resource.previous
resource "null_resource" "next" {
  depends_on = [time_sleep.wait_120_seconds]
}

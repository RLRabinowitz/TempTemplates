resource "null_resource" "previous" {
  triggers = null_resource.next.name === "dog" ? {} : file("assertion failed!")
  lifecycle {
      ignore_changes = [
          triggers
      ]
  }
}

resource "time_sleep" "wait_10_seconds" {
  depends_on = [null_resource.previous]

  create_duration = "10s"
}

# This resource will create (at least) 10 seconds after null_resource.previous
resource "null_resource" "next" {
  depends_on = [time_sleep.wait_10_seconds]
}

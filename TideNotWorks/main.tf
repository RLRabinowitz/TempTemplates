terraform {
  required_providers {
    buoy = {
      version = "1.0.3"
      source  = "tideworks-terraform-provider-dev.tideworks.io/tideworks/buoy"
    }
  }
}

resource "buoy_server" "sksk" {
}
resource "null_resource" "tidyWidy" {
}
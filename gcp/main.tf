provider "google" {
  project = "cool-reserve-398319"
  region  = "us-west1"
  zone  = "us-west1-a"

}

resource "google_compute_instance" "google-i128" {
  name         = "gcp-test-test"
  machine_type = "n2-standard-128"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network       = "default"
    access_config {
    }
  }
}

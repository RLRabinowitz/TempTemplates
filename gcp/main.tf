provider "google" {
  project = "cool-reserve-398319"
  region  = "us-west1"
  zone  = "us-west1-a"

}

resource "google_compute_instance" "google-i" {
  name         = "gcp-test-test"
  machine_type = "n1-standard-1"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network       = "default"
    access_config {
    }
  }
}

provider "google" {
  project = "env0project"
  region  = "us-west1"
  zone  = "us-west1-a"

}

resource "google_compute_instance" "google-i1" {
  name         = "gcp-test-test1"
  machine_type = "n1-standard-1"

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

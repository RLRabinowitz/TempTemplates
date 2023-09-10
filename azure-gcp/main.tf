provider "azurerm" {
  version = "3.28.0"
  features {

  }

  subscription_id = "88044971-f276-44a3-9296-b9150d5ac53d"
  tenant_id       = "58548da8-4c67-4ef0-87bb-8b9345b6ab0e"
}

# Vars

variable "client_name" {
  default = "Socks"
}

variable "client_logo_url" {
  default = "https://www.jojomamanbebe.com/media/catalog/product/cache/1/image/1000x/cc44d3b39965d3efd15a8158cb2fdfb4/d/2/d2617redc4.jpg"
}

# Resources

resource "random_string" "random" {
  length  = 4
  special = false
  upper   = false
}

resource "azurerm_resource_group" "group" {
  name     = "env0${random_string.random.result}-${var.client_name}-group"
  location = "northeurope"
}

resource "azurerm_service_plan" "appserviceplan" {
  name                = "${azurerm_resource_group.group.name}-plan"
  location            = azurerm_resource_group.group.location
  resource_group_name = azurerm_resource_group.group.name
  os_type             = "Linux"

  sku_name = "P1v2"
}

resource "azurerm_app_service" "dockerapp" {
  name                = "${azurerm_resource_group.group.name}-app"
  location            = azurerm_resource_group.group.location
  resource_group_name = azurerm_resource_group.group.name
  app_service_plan_id = azurerm_service_plan.appserviceplan.id

  # Do not attach Storage by default
  app_settings = {
    WEBSITES_ENABLE_APP_SERVICE_STORAGE = false
    CLIENT_NAME                         = "${var.client_name}"
    CLIENT_LOGO_URL                     = "${var.client_logo_url}"
  }

  site_config {
    linux_fx_version = "DOCKER|env0/demo-container:latest"
    always_on        = "true"
  }

  identity {
    type = "SystemAssigned"
  }
}

# Outputs 

output "default_site_hostname" {
  value = azurerm_app_service.dockerapp.default_site_hostname
}

provider "google" {
  project = "cool-reserve-398319"
  region  = "us-west1"
  zone  = "us-west1-a"

}

resource "google_compute_instance" "google-i128" {
  name         = "gcp-test-test2"
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

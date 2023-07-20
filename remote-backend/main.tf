variable "organizationId" {}
variable "backendHost" {
  default = "backend-dev.api.dev.env0.com"
}
# Defined in the env0.yml
variable "randomEnv" {}

terraform {
  backend "remote" {
    hostname = var.backendHost
    organization = var.organizationId
    workspaces {
      name = "shared-environment-${var.randomEnv}"
    }
  }
}

resource "null_resource" "null" {
}


output "test" {
  value = "123-456"
}

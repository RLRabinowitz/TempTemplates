module "prereq" {
  source = "github.com/env0/k8s-modules//aws"

  modules_info = {
    vpc = {
      create = false
      id = var.vpc_id
    }
    efs = {
      create = false
      id = var.efs_id
    },
    autoscaler = {
      create = true
    }
    csi_driver = {
      create = true
    }
    eks = {
      create = true
    }
  }

  region = "us-east-1"
  cluster_name = "arel-shld-cluster"
}

provider "aws" {
  region = "us-east-1"
}

resource "helm_release" "agent" {
  depends_on       = [module.prereq] // add all necessary dependencies here
  name             = "env0-agent-arel"
  namespace        = "env0-agent-arel"
  chart            = "env0-agent"
  create_namespace = true
  repository       = "https://env0.github.io/self-hosted"
  timeout          = 600
  values           = [
    yamlencode(var.env0_values)
  ]
}

variable "env0_values" {}
variable "vpc_id" {}
variable "efs_id" {}

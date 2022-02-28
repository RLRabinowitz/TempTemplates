module "prereq" {
  source = "github.com/env0/k8s-modules//aws"

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

data "aws_eks_cluster" "cluster" {
  name = module.prereq.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.prereq.cluster_id
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.cluster.token
}

provider "kubectl" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.cluster.token
  load_config_file       = false
}

provider "helm" {
  kubernetes {
    host                   = data.aws_eks_cluster.cluster.endpoint
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
    exec {
      api_version = "client.authentication.k8s.io/v1alpha1"
      args        = ["eks", "get-token", "--cluster-name", data.aws_eks_cluster.cluster.name]
      command     = "aws"
    }
  }
}

terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws        = "~> 3.68.0"
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.7.0"
    }
  }
}

variable "env0_values" {}
variable "vpc_id" {}
variable "efs_id" {}

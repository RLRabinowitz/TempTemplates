resource "null_resource" "null222" {
}

module "kaka" {
  source  = "git::ssh://git@github.com/env0/blueprints-private-tf-module.git"
}

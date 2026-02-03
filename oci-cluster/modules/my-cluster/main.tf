variable "regions" {
  type    = set(string)
  default = ["us-east-1"]
}

module "my-region" {
  source   = "./modules/my-region"
  for_each = var.regions
  region   = each.key
}

module "module" {
  source = "../resources"
}

output "null_resource_id" {
  value = module.module.null_resource_id
}
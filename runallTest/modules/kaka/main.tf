module "module" {
  source = "../../resources"
  trigger = "zero"
}

output "null_resource_id" {
  value = module.module.null_resource_id
}
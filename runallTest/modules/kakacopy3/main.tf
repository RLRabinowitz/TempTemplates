module "module" {
  source = "../../resources"
  trigger = "copy3"
}

output "null_resource_id" {
  value = module.module.null_resource_id
}
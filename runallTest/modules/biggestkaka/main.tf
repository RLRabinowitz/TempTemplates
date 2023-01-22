module "module" {
  source = "../../bucket"
}

output "bucket_name" {
  value = module.module.bucket_name
}
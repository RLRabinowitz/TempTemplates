module "module" {
  source = "../../bucket"
  providers = {
    aws = aws
   }
}

output "bucket_name" {
  value = module.module.bucket_name
}
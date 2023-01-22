provider "aws" {
  version = "~> 2.0"
  region  = "us-east-1"
}

module "module" {
  source = "../../bucket"
  providers = {
    aws = aws
   }
}

output "bucket_name" {
  value = module.module.bucket_name
}
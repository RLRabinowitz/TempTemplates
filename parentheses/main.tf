terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 2.0.0"
    }
  }
}

resource "aws_s3_bucket" "example" {
  bucket = "arel-temp-parentheses"
  acl    = (false ? "public-read" : "private")
  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["PUT", "POST"]
    allowed_origins = ["https://env0.com"]
    expose_headers  = ["ETag"]
    max_age_seconds = 3000
  }
}

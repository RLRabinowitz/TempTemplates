provider "random" {}

resource "random_string" "random" {
  length = 16
  special = false
  min_lower = 16
}

resource "aws_s3_bucket" "website_bucket" {
  bucket = "hello-env0-${random_string.random.result}"
  acl    = "public-read"

  force_destroy = true 
}

output "bucket_name" {
  value =  "${aws_s3_bucket.website_bucket.arn}"
}
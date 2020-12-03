terraform {
  source = "my_buckets.tf"
}

remote_state {
  backend = "s3"
  config = {
    bucket         = "arel-temp"
    key            = "path/to/new"
    region         = "us-east-1"
  }
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
}

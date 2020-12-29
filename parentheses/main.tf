resource "aws_s3_bucket" "example" {
  bucket = "arel-temp-parentheses"
  acl    = (false ? "public-read" : "private")
}

resource "aws_s3_bucket" "mine" {
  bucket = "arel-hackaton-ai-2"
  
  lifecycle {
    prevent_destroy = true
  }
  
}

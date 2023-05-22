
resource "aws_s3_bucket" "mine" {
  bucket = "arel-hackaton-ai-${var.suffix}"
  
  lifecycle {
    prevent_destroy = true
  }
  
  tags_all = {
    "f" = "ff"
  }
}

variable "suffix" {
  
}
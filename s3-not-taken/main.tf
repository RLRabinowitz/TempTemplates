resource "aws_s3_bucket" "mine" {
  bucket = "arel-hackaton-ai-${var.suffix}"
  
  lifecycle {
    prevent_destroy = true
  }

  tags = {
    MyTag = "Taggy"
  }
  
}

resource "aws_s3_bucket" "mine" {
  bucket = "arel-hackaton-ai-${var.suffix}-2"
  
  lifecycle {
    prevent_destroy = true
  }

  tags = {
    MyTag = "Taggy"
  }
  
}

variable "suffix" {
  
}

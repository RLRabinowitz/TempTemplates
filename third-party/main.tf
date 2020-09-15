terraform {
  required_version = ">= 0.13.0"
  required_providers {
    elasticsearch = {
      source = "my-proj/my-inner/elasticsearch"
      version = "1.0.0"
    }
  }
}

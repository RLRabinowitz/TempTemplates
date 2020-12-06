# my_buckets.tf
module "bucket" {
  for_each = toset(["arel-temp-assets", "arel-temp-medias"])
  source   = "./publish_bucket"
  name     = "${each.key}-bucket"
}

# my_buckets.tf
module "bucket" {
  for_each = toset(["arel_temp_assets", "arel_temp_media"])
  source   = "./publish_bucket"
  name     = "${each.key}_bucket"
}

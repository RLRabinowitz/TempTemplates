module "regular" {
  source = "api-pr17766.dev.env0.com/fbb66da9-d3c2-491d-bb14-0833e6a8b218/regular/one"
  version = "1.0.1"
}

resource "null_resource" "null" {}

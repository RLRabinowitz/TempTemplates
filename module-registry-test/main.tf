module "binary-authorization" {
  source = "api-dev.dev.env0.com/9e4c5088-720d-4912-98a3-8b0c7e904a0f/binary-authorization/vmo2-gitlab-shared"
  version = "1.0"
}

credentials "api-dev.dev.env0.com" {
  # A valid Basic authentication header value, using your env0 API Key ID and Secret
  token = "Basic base64-encoded(var.API_KEY)"
}
  
variable "API_KEY" {
}

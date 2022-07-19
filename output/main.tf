resource "random_string" "rand" {
  length = 0
}

output "my_random_string" {
  value = random_string.rand.result
}
resource "random_string" "rand" {
  length = 5
}

output "my_random_string" {
  value = random_string.rand.result
}

output "multi_line_message" {
  value = <<EOT
This is a constant multi-line string output.
-------------------------------------------
1. This line is static text.
2. Terraform handles heredoc strings easily.
3. You can include special characters: !@#$%
4. Line four is right here.
5. Almost halfway through the minimum.
6. The random string generated was: ${random_string.rand.result}
7. You can even interpolate variables like above.
8. This is the eighth line of the string.
9. Just one more to go after this.
10. This is the tenth and final line.
EOT
}

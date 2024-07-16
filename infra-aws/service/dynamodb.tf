resource "aws_dynamodb_table" "custom_table" {
  name         = var.custom_dynamodb_table_name
  billing_mode = "PAY_PER_REQUEST"

  attribute {
    name = "id"
    type = "S"
  }

  hash_key = "id"
}

output "custom_table_name" {
  value = aws_dynamodb_table.custom_table.name
}

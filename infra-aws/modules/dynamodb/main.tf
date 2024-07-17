resource "aws_dynamodb_table" "custom_table" {
  name         = var.dynamodb_table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "ID"

  attribute {
    name = "ID"
    type = "S"
  }

  tags = var.tags
}

output "dynamodb_table_name" {
  value = aws_dynamodb_table.custom_table.name
}

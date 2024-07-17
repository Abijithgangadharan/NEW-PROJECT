module "dynamodb_table" {
  source         = "../modules/dynamodb_table"
  table_name     = "my-custom-table"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "id"
  hash_key_type  = "S"
  range_key      = "timestamp"
  range_key_type = "N"
  tags = {
    Environment = "dev"
    Project     = "my-project"
  }
}

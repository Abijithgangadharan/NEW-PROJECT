module "lambda" {
  source = "../modules/lambda"
}

module "logs" {
  source = "../modules/logs"
}

module "dynamodb_custom_table" {
  source = "../modules/dynamodb"
  table_name = var.custom_dynamodb_table_name
}

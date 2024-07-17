module "dynamodb_table" {
  source = "../modules/dynamodb"
  
  table_name = var.dynamodb_table_name  # Reference the variable from dynamodb/variables.tf
  tags       = var.tags                 # Assuming tags is also defined in dynamodb/variables.tf
}

module "lambda" {
  source = "../modules/lambda"

  function_name = var.lambda_function_name
  handler        = var.lambda_handler
  runtime        = var.lambda_runtime
  s3_bucket      = var.lambda_s3_bucket
  s3_key         = var.lambda_s3_key
  dynamodb_table = module.dynamodb_table.table_name  # Access the output from dynamodb_table
  tags           = var.tags
}

module "logs" {
  source = "../modules/logs"

  lambda_function_name = module.lambda.function_name  # Access the output from lambda
  tags                   = var.tags
}

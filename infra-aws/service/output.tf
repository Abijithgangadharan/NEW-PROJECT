output "lambda_function_name" {
  description = "The name of the Lambda function"
  value       = module.lambda.function_name
}

output "lambda_function_arn" {
  description = "The ARN of the Lambda function"
  value       = module.lambda.function_arn
}

output "lambda_execution_role" {
  description = "The IAM role ARN used by Lambda"
  value       = module.lambda.lambda_exec_role_arn
}

output "dynamodb_table_name" {
  description = "The name of the DynamoDB table"
  value       = module.dynamodb_table.dynamodb_table_name
}

output "dynamodb_table_arn" {
  description = "The ARN of the DynamoDB table"
  value       = module.dynamodb_table.dynamodb_table_arn
}

output "cloudwatch_log_group_name" {
  description = "The name of the CloudWatch Log Group"
  value       = module.logs.cloudwatch_log_group_name
}

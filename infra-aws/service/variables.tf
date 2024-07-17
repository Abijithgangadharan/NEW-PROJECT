variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-1"
}

variable "dynamodb_table_name" {
  description = "Name of the DynamoDB table"
  type        = string
}

variable "lambda_function_name" {
  description = "Name of the Lambda function"
  type        = string
}

variable "lambda_handler" {
  description = "Lambda handler"
  type        = string
  default     = "index.handler"
}

variable "lambda_runtime" {
  description = "Lambda runtime environment"
  type        = string
  default     = "nodejs20.x"
}

variable "lambda_s3_bucket" {
  description = "S3 bucket for Lambda code"
  type        = string
}

variable "lambda_s3_key" {
  description = "S3 key for Lambda code"
  type        = string
}

variable "tags" {
  description = "Tags for resources"
  type        = map(string)
  default = {
    Project     = "my-project"
    Environment = "dev"
  }
}

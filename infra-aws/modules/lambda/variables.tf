variable "function_name" {
  description = "Name of the Lambda function"
  type        = string
}

variable "handler" {
  description = "Lambda handler"
  type        = string
}

variable "runtime" {
  description = "Lambda runtime environment"
  type        = string
}

variable "s3_bucket" {
  description = "S3 bucket for Lambda code"
  type        = string
}

variable "s3_key" {
  description = "S3 key for Lambda code"
  type        = string
}

variable "dynamodb_table" {
  description = "Name of the DynamoDB table"
  type        = string
}

variable "tags" {
  description = "Tags for resources"
  type        = map(string)
}

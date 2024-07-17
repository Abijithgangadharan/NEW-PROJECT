variable "lambda_function_name" {
  description = "Name of the Lambda function"
  type        = string
}

variable "tags" {
  description = "Tags for resources"
  type        = map(string)
}

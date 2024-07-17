variable "dynamodb_table_name" {
  description = "Name of the DynamoDB table"
  type        = string
}

variable "tags" {
  description = "Tags for resources"
  type        = map(string)
}

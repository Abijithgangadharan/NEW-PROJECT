resource "aws_s3_bucket" "lambda_bucket" {
  bucket = var.s3_bucket

  tags = var.tags
}

resource "aws_s3_bucket_object" "lambda_zip" {
  bucket = aws_s3_bucket.lambda_bucket.bucket
  key    = var.s3_key
  source = "lambda_function_payload.zip"
  etag   = filemd5("lambda_function_payload.zip")
}

resource "aws_lambda_function" "my_lambda" {
  function_name = var.function_name
  s3_bucket     = aws_s3_bucket.lambda_bucket.bucket
  s3_key        = aws_s3_bucket_object.lambda_zip.key
  handler       = var.handler
  runtime       = var.runtime
  role          = aws_iam_role.lambda_exec.arn

  environment {
    variables = {
      DYNAMODB_TABLE = var.dynamodb_table
    }
  }

  tags = var.tags
}

resource "aws_iam_role" "lambda_exec" {
  name = "lambda_exec_role_new"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
    ],
  })

  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "lambda_exec_attach" {
  role       = aws_iam_role.lambda_exec.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

output "function_name" {
  value = aws_lambda_function.my_lambda.function_name
}

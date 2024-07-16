resource "aws_iam_role" "lambda_exec" {
  name = "lambda_exec_role"

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
}

resource "aws_iam_role_policy_attachment" "lambda_exec_attach" {
  role       = aws_iam_role.lambda_exec.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_lambda_function" "my_lambda" {
  function_name = "my_lambda_function"
  role          = aws_iam_role.lambda_exec.arn
  handler       = "index.handler"
  runtime       = "nodejs14.x"
  filename      = "lambda_function_payload.zip"

  source_code_hash = filebase64sha256("lambda_function_payload.zip")

  environment {
    variables = {
      DYNAMODB_TABLE = aws_dynamodb_table.custom_table.name
    }
  }

  depends_on = [aws_iam_role_policy_attachment.lambda_exec_attach]
}

resource "aws_s3_bucket_object" "lambda_zip" {
  bucket = aws_s3_bucket.lambda_bucket.bucket
  key    = "lambda_function_payload.zip"
  source = "lambda_function_payload.zip"
  etag   = filemd5("lambda_function_payload.zip")
}

resource "aws_lambda_function_event_invoke_config" "example" {
  function_name = aws_lambda_function.my_lambda.function_name

  destination_config {
    on_failure {
      destination = aws_sqs_queue.example.arn
    }
    on_success {
      destination = aws_sqs_queue.example.arn
    }
  }

  maximum_retry_attempts      = 2
  maximum_event_age_in_seconds = 3600
}

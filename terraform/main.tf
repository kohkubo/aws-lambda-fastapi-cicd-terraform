resource "aws_s3_bucket" "lambda_bucket" {
  bucket = var.s3_bucket_name
}

resource "aws_lambda_function" "api_lambda" {
  filename      = "api.zip"
  function_name = "serverless-api-${var.environment}"
  role          = aws_iam_role.lambda_role.arn
  handler       = "main.handler"
  runtime       = "python3.12"
  architectures = ["arm64"]

  source_code_hash = filebase64sha256("api.zip")
}

resource "aws_iam_role" "lambda_role" {
  name = "serverless_api_lambda_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

# ruleid: aws-lambda-x-ray-tracing-not-active
resource "aws_lambda_function" "fail_1" {
  filename      = "lambda_function_payload.zip"
  function_name = "lambda_function_name"
  role          = aws_iam_role.iam_for_lambda.arn
}

# ruleid: aws-lambda-x-ray-tracing-not-active
resource "aws_lambda_function" "fail_2" {
  filename      = "lambda_function_payload.zip"
  function_name = "lambda_function_name"
  role          = aws_iam_role.iam_for_lambda.arn
  tracing_config {
    mode = "PassThrough"
  }
}

# ok: aws-lambda-x-ray-tracing-not-active
resource "aws_lambda_function" "pass" {
  filename      = "lambda_function_payload.zip"
  function_name = "lambda_function_name"
  role          = aws_iam_role.iam_for_lambda.arn
  tracing_config {
    mode = "Active"
  }
}

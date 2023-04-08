# ruleid: aws-lambda-permission-unrestricted-source-arn
resource "aws_lambda_permission" "fail_1" {
  statement_id  = "AllowExecutionFromSNS"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.func.function_name
  principal     = "sns.amazonaws.com"
}

# ruleid: aws-lambda-permission-unrestricted-source-arn
resource "aws_lambda_permission" "fail_2" {
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.func.function_name
  principal     = "events.amazonaws.com"
}

# ruleid: aws-lambda-permission-unrestricted-source-arn
resource "aws_lambda_permission" "fail_3" {
  statement_id  = "AllowMyDemoAPIInvoke"
  action        = "lambda:InvokeFunction"
  function_name = "MyDemoFunction"
  principal     = "apigateway.amazonaws.com"
}

# ok: aws-lambda-permission-unrestricted-source-arn
resource "aws_lambda_permission" "pass_1" {
  statement_id  = "AllowExecutionFromSNS"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.func.function_name
  principal     = "sns.amazonaws.com"
  source_arn    = aws_sns_topic.default.arn
}

# ok: aws-lambda-permission-unrestricted-source-arn
resource "aws_lambda_permission" "pass_2" {
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.func.function_name
  principal     = "events.amazonaws.com"
  source_arn    = "arn:aws:events:eu-west-1:111122223333:rule/RunDaily"
}

# ok: aws-lambda-permission-unrestricted-source-arn
resource "aws_lambda_permission" "pass_3" {
  statement_id  = "AllowMyDemoAPIInvoke"
  action        = "lambda:InvokeFunction"
  function_name = "MyDemoFunction"
  principal     = "apigateway.amazonaws.com"

  # The /* part allows invocation from any stage, method and resource path
  # within API Gateway.
  source_arn = "${aws_api_gateway_rest_api.MyDemoAPI.execution_arn}/*"
}

# ok: aws-lambda-permission-unrestricted-source-arn
resource "aws_lambda_permission" "pass_4" {
  statement_id  = "AllowCrossAccountExecution"
  action        = "lambda:InvokeFunctionUrl"
  function_name = aws_lambda_function.func.function_name
  principal     = "arn:aws:iam::444455556666:role/example"

  source_account         = "444455556666"
  function_url_auth_type = "AWS_IAM"
}

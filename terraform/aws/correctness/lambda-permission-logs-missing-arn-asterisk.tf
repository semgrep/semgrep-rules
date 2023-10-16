resource "aws_lambda_permission" "allow_cloudwatch" {
  statement_id  = "${var.name}-allow-execution-from-cloudwatch"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda_function.function_name
  principal     = "logs.amazonaws.com"
  # ruleid: lambda-permission-logs-missing-arn-asterisk
  source_arn    = "arn:aws:logs:us-west-2:${data.aws_caller_identity.current.account_id}:log-group:${var.log_group_name}"

  depends_on = [aws_lambda_function.lambda_function]
}

resource "aws_lambda_permission" "allow_cloudwatch" {
  statement_id  = "${var.name}-allow-execution-from-cloudwatch"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda_function.function_name
  principal     = "logs.amazonaws.com"
  # ok: lambda-permission-logs-missing-arn-asterisk
  source_arn    = "arn:aws:logs:us-west-2:${data.aws_caller_identity.current.account_id}:log-group:${var.log_group_name}:*"

  depends_on = [aws_lambda_function.lambda_function]
}

resource "aws_lambda_permission" "allow_cloudwatch" {
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.test_lambda.function_name
  principal     = "events.amazonaws.com"
  # ok: lambda-permission-logs-missing-arn-asterisk
  source_arn    = "arn:aws:events:eu-west-1:111122223333:rule/RunDaily"
  qualifier     = aws_lambda_alias.test_alias.name
}

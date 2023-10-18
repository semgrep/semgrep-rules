# ruleid: subscription-filter-missing-depends
resource "aws_cloudwatch_log_subscription_filter" "log_subscription_filter" {
  name            = var.name
  log_group_name  = var.log_group_name
  filter_pattern  = var.subscription_filter_pattern
  destination_arn = aws_lambda_function.forward_to_sns.arn
}

# ruleid: subscription-filter-missing-depends
resource "aws_cloudwatch_log_subscription_filter" "log_subscription_filter" {
  name            = var.name
  log_group_name  = var.log_group_name
  filter_pattern  = var.subscription_filter_pattern
  destination_arn = aws_lambda_function.forward_to_sns.arn

  depends_on = [aws_lambda_function.forward_to_sns]
}

# ok: subscription-filter-missing-depends
resource "aws_cloudwatch_log_subscription_filter" "log_subscription_filter" {
  name            = var.name
  log_group_name  = var.log_group_name
  filter_pattern  = var.subscription_filter_pattern
  destination_arn = aws_lambda_function.forward_to_sns.arn

  depends_on = [aws_lambda_permission.allow_cloudwatch]
}

# ok: subscription-filter-missing-depends
resource "aws_cloudwatch_log_subscription_filter" "log_subscription_filter" {
  name            = var.name
  log_group_name  = var.log_group_name
  filter_pattern  = var.subscription_filter_pattern
  destination_arn = aws_lambda_function.forward_to_sns.arn

  depends_on = [aws_lambda_permission.allow_cloudwatch, aws_lambda_function.forward_to_sns]
}

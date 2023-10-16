resource "aws_lambda_function" "forward_to_sns" {
  function_name = "${var.name}-cloudwatch-forward-to-sns"
  role          = aws_iam_role.lambda_to_sns.arn
  timeout       = 120
  package_type  = "Image"
  image_uri     = "public.aws.ecr/util/whatever:develop"
  handler       = "main.lambda_handler"
  runtime       = "python3.9"

  environment {
    variables = {
      # ok: reserved-aws-lambda-environment-variable
      SNS_TOPIC_ARN = aws_sns_topic.sns_topic.arn
      # ruleid: reserved-aws-lambda-environment-variable
      AWS_REGION    = var.region
    }
  }
}

resource "aws_lambda_function" "forward_to_sns" {
  function_name = "${var.name}-cloudwatch-forward-to-sns"
  role          = aws_iam_role.lambda_to_sns.arn
  timeout       = 120
  package_type  = "Image"
  image_uri     = "public.aws.ecr/util/whatever:develop"
  handler       = "main.lambda_handler"
  runtime       = "python3.9"

  environment {
    variables = {
      # ok: reserved-aws-lambda-environment-variable
      SNS_TOPIC_ARN = aws_sns_topic.sns_topic.arn
      # ok: reserved-aws-lambda-environment-variable
      AWS_REGION_FOR_TOPIC = var.region
    }
  }
}
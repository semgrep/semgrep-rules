resource "aws_lambda_function" "forward_to_sns" {
  function_name = "${var.name}-cloudwatch-forward-to-sns"
  role          = aws_iam_role.lambda_to_sns.arn
  timeout       = 120
  package_type  = "Image"
  image_uri     = "image/goes/here"
  # ruleid: lambda-redundant-field-with-image
  handler       = "main.lambda_handler"
  # ruleid: lambda-redundant-field-with-image
  runtime       = "python3.9"

  environment {
    variables = {
      SNS_TOPIC_ARN           = aws_sns_topic.sns_topic.arn
      AWS_REGION_OF_SNS_TOPIC = var.region
    }
  }
  depends_on = [aws_iam_role.lambda_to_sns]
}

resource "aws_lambda_function" "forward_to_sns" {
  function_name = "${var.name}-cloudwatch-forward-to-sns"
  role          = aws_iam_role.lambda_to_sns.arn
  timeout       = 120
  package_type  = "Image"
  image_uri     = "image/goes/here"
  # ruleid: lambda-redundant-field-with-image
  handler       = "main.lambda_handler"

  environment {
    variables = {
      SNS_TOPIC_ARN           = aws_sns_topic.sns_topic.arn
      AWS_REGION_OF_SNS_TOPIC = var.region
    }
  }
  depends_on = [aws_iam_role.lambda_to_sns]
}

resource "aws_lambda_function" "forward_to_sns" {
  function_name = "${var.name}-cloudwatch-forward-to-sns"
  role          = aws_iam_role.lambda_to_sns.arn
  timeout       = 120
  package_type  = "Image"
  image_uri     = "image/goes/here"
  # ruleid: lambda-redundant-field-with-image
  runtime       = "python3.9"

  environment {
    variables = {
      SNS_TOPIC_ARN           = aws_sns_topic.sns_topic.arn
      AWS_REGION_OF_SNS_TOPIC = var.region
    }
  }
  depends_on = [aws_iam_role.lambda_to_sns]
}

resource "aws_lambda_function" "forward_to_sns" {
  function_name = "${var.name}-cloudwatch-forward-to-sns"
  role          = aws_iam_role.lambda_to_sns.arn
  timeout       = 120
  package_type  = "Image"
  # ok: lambda-redundant-field-with-image
  image_uri     = "image/goes/here"

  environment {
    variables = {
      SNS_TOPIC_ARN           = aws_sns_topic.sns_topic.arn
      AWS_REGION_OF_SNS_TOPIC = var.region
    }
  }
  depends_on = [aws_iam_role.lambda_to_sns]
}

resource "aws_lambda_function" "forward_to_sns" {
  function_name = "${var.name}-cloudwatch-forward-to-sns"
  role          = aws_iam_role.lambda_to_sns.arn
  timeout       = 120
  package_type  = "Zip"
  image_uri     = "image/goes/here"
  # ok: lambda-redundant-field-with-image
  handler       = "main.lambda_handler"
  # ok: lambda-redundant-field-with-image
  runtime       = "python3.9"

  environment {
    variables = {
      SNS_TOPIC_ARN           = aws_sns_topic.sns_topic.arn
      AWS_REGION_OF_SNS_TOPIC = var.region
    }
  }
  depends_on = [aws_iam_role.lambda_to_sns]
}


resource "aws_lambda_function" "forward_to_sns" {
  function_name = "${var.name}-cloudwatch-forward-to-sns"
  role          = aws_iam_role.lambda_to_sns.arn
  timeout       = 120
  image_uri     = "image/goes/here"
  # ok: lambda-redundant-field-with-image
  handler       = "main.lambda_handler"
  # ok: lambda-redundant-field-with-image
  runtime       = "python3.9"

  environment {
    variables = {
      SNS_TOPIC_ARN           = aws_sns_topic.sns_topic.arn
      AWS_REGION_OF_SNS_TOPIC = var.region
    }
  }
  depends_on = [aws_iam_role.lambda_to_sns]
}

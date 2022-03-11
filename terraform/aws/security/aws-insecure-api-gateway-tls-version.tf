# ruleid: aws-insecure-api-gateway-tls-version
resource "aws_api_gateway_domain_name" "badCode" {
  domain_name = "api.badCode.com"
  security_policy = "TLS_1_0"
}

# ruleid: aws-insecure-api-gateway-tls-version
resource "aws_apigatewayv2_domain_name" "badCode" {
  domain_name = "api.badCode.com"
  domain_name_configuration {}
}

# ok: aws-insecure-api-gateway-tls-version
resource "aws_api_gateway_domain_name" "okCode" {
  domain_name = "api.okCode.com"
  security_policy = "TLS_1_2"
}

# ok: aws-insecure-api-gateway-tls-version
resource "aws_apigatewayv2_domain_name" "okCode" {
  domain_name = "api.okCode.com"
  domain_name_configuration {
    security_policy = "TLS_1_2"
  }
}

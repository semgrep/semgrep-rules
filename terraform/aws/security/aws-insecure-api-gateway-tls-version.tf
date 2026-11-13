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
resource "aws_api_gateway_domain_name" "okTls13Only" {
  domain_name          = "api.okTls13Only.com"
  security_policy      = "SecurityPolicy_TLS13_1_3_2025_09"
  endpoint_access_mode = "STRICT"
}

# ok: aws-insecure-api-gateway-tls-version
resource "aws_api_gateway_domain_name" "okPostQuantum" {
  domain_name          = "api.okPostQuantum.com"
  security_policy      = "SecurityPolicy_TLS13_1_2_PQ_2025_09"
  endpoint_access_mode = "BASIC"
}

# ok: aws-insecure-api-gateway-tls-version
resource "aws_api_gateway_domain_name" "okEdge" {
  domain_name          = "api.okEdge.com"
  security_policy      = "SecurityPolicy_TLS13_2025_EDGE"
  endpoint_access_mode = "STRICT"
  endpoint_configuration {
    types = ["EDGE"]
  }
}

# ok: aws-insecure-api-gateway-tls-version
resource "aws_apigatewayv2_domain_name" "okCode" {
  domain_name = "api.okCode.com"
  domain_name_configuration {
    security_policy = "TLS_1_2"
  }
}

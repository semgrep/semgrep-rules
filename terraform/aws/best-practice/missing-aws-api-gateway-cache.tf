# ruleid: missing-aws-api-gateway-cache
resource "aws_api_gateway_stage" "fail" {
  name = "example"
}

# ok: missing-aws-api-gateway-cache
resource "aws_api_gateway_stage" "pass" {
  name = "example"
  cache_cluster_enabled = true
}

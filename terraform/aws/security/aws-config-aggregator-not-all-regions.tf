# ok: aws-config-aggregator-not-all-regions
resource "aws_config_configuration_aggregator" "pass_1" {
   name = "example"

   account_aggregation_source {
     account_ids = ["123456789012"]
     all_regions = true
   }
}

# ok: aws-config-aggregator-not-all-regions
resource "aws_config_configuration_aggregator" "pass_2" {
   name = "example"

   organization_aggregation_source {
     account_ids = ["123456789012"]
     all_regions = true
   }
}

# ruleid: aws-config-aggregator-not-all-regions
resource "aws_config_configuration_aggregator" "fail_1" {
   name = "example"

   account_aggregation_source {
     account_ids = ["123456789012"]
     regions     = ["us-west-2", "eu-west-1"]
   }
}

# ruleid: aws-config-aggregator-not-all-regions
resource "aws_config_configuration_aggregator" "fail_1" {
   name = "example"

   organization_aggregation_source {
    account_ids = ["123456789012"]
    regions     = ["us-west-2", "eu-west-1"]
  }
}

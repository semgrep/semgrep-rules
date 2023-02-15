# ruleid: aws-athena-client-can-disable-workgroup-encryption
resource "aws_athena_workgroup" "fail" {
  name = "example"

  configuration {
    enforce_workgroup_configuration    = false
    publish_cloudwatch_metrics_enabled = true

    result_configuration {
      output_location = "s3://${aws_s3_bucket.example.bucket}/output/"

      encryption_configuration {
        encryption_option = "SSE_KMS"
        kms_key_arn       = aws_kms_key.example.arn
      }
    }
  }
}

# ok: aws-athena-client-can-disable-workgroup-encryption
resource "aws_athena_workgroup" "pass_with_no_encryption" {
  name = "example"
}

# ok: aws-athena-client-can-disable-workgroup-encryption
resource "aws_athena_workgroup" "pass_with_encryption_1" {
  name = "example"

  configuration {
    publish_cloudwatch_metrics_enabled = true

    result_configuration {
      output_location = "s3://${aws_s3_bucket.example.bucket}/output/"

      encryption_configuration {
        encryption_option = "SSE_KMS"
        kms_key_arn       = aws_kms_key.example.arn
      }
    }
  }
}

# ok: aws-athena-client-can-disable-workgroup-encryption
resource "aws_athena_workgroup" "pass_with_encryption_2" {
  name = "example"

  configuration {
    enforce_workgroup_configuration    = true
    publish_cloudwatch_metrics_enabled = true

    result_configuration {
      output_location = "s3://${aws_s3_bucket.example.bucket}/output/"

      encryption_configuration {
        encryption_option = "SSE_KMS"
        kms_key_arn       = aws_kms_key.example.arn
      }
    }
  }
}

# ruleid: aws-kinesis-stream-unencrypted
resource "aws_kinesis_stream" "fail_1" {
  name = "example-stream"

  stream_mode_details {
    stream_mode = "ON_DEMAND"
  }
}

# ruleid: aws-kinesis-stream-unencrypted
resource "aws_kinesis_stream" "fail_2" {
  name            = "example-stream"
  encryption_type = "NONE"

  stream_mode_details {
    stream_mode = "ON_DEMAND"
  }
}

# ok: aws-kinesis-stream-unencrypted
resource "aws_kinesis_stream" "pass" {
  name            = "example-stream"
  encryption_type = "KMS"

  stream_mode_details {
    stream_mode = "ON_DEMAND"
  }
}

# ruleid: aws-ecr-image-scanning-disabled
resource "aws_ecr_repository" "fail_1" {
  name = "example"
}

# ruleid: aws-ecr-image-scanning-disabled
resource "aws_ecr_repository" "fail_2" {
  name = "example"

  image_scanning_configuration {
    scan_on_push = false
  }
}

# ok: aws-ecr-image-scanning-disabled
resource "aws_ecr_repository" "pass" {
  name = "example"

  image_scanning_configuration {
    scan_on_push = true
  }
}

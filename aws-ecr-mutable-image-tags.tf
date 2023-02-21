# ruleid: aws-ecr-mutable-image-tags
resource "aws_ecr_repository" "fail_1" {
  name = "example"
}

# ruleid: aws-ecr-mutable-image-tags
resource "aws_ecr_repository" "fail_2" {
  name                 = "example"
  image_tag_mutability = "MUTABLE"
}

# ok: aws-ecr-mutable-image-tags
resource "aws_ecr_repository" "pass" {
  name                 = "example"
  image_tag_mutability = "IMMUTABLE"
}

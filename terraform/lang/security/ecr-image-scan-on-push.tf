resource "aws_ecr_repository" "foo" {
  name                 = "test-repository"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_ecr_repository" "foo" {
  name                 = "test-repository"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
}

resource "aws_ecr_repository" "repository" {
  name                 = "test-repository"
  image_tag_mutability = "MUTABLE"

  tags = {
    Name = "test-repository"
  }
}

# ruleid: eks-public-endpoint-enabled
resource "aws_eks_cluster" "example" {
  name     = "example"
  role_arn = aws_iam_role.example.arn
  vpc_config {
    subnet_ids = [aws_subnet.example1.id, aws_subnet.example2.id]
  }

}

# ruleid: eks-public-endpoint-enabled
resource "aws_eks_cluster" "example" {
  name     = "example"
  role_arn = aws_iam_role.example.arn
}

resource "aws_eks_cluster" "example" {
  name     = "example"
  role_arn = aws_iam_role.example.arn

  vpc_config {
    endpoint_public_access = false
    subnet_ids = [aws_subnet.example1.id, aws_subnet.example2.id]
  }
}

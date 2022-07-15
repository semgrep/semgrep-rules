resource "aws_eks_cluster" "insecure_defaults" {
  # ruleid: eks-insufficient-control-plane-logging
  name                      = "my-cluster"
}

resource "aws_eks_cluster" "missing_api_logging" {
  # ruleid: eks-insufficient-control-plane-logging
  name                      = "my-cluster"
  enabled_cluster_log_types = ["audit"]
}


resource "aws_eks_cluster" "ok_1" {
  # ok: eks-insufficient-control-plane-logging
  enabled_cluster_log_types = ["api", "audit"]
  name                      = "my-cluster"
}

resource "aws_eks_cluster" "ok_2" {
  # ok: eks-insufficient-control-plane-logging
  enabled_cluster_log_types = ["audit", "api"]
  name                      = "my-cluster"
}

resource "aws_eks_cluster" "ok_3" {
  # ok: eks-insufficient-control-plane-logging
  enabled_cluster_log_types = ["api", "somethingelse", "audit"]
  name                      = "my-cluster"
}
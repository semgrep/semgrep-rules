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

resource "aws_eks_cluster" "eks_cluster" {
  name                      = "my-cluster-${var.test}"
  # ok: eks-insufficient-control-plane-logging
  enabled_cluster_log_types = [
    "api",
    "audit",
    "authenticator",
    "controllerManager",
    "scheduler"
  ]

  dynamic "encryption_config" {
    for_each = 1
    content {
      provider {
        key_arn = aws_kms_key.k8s_cluster_secret_encryption_key.arn
      }
      resources = [
        "secrets"
      ]
    }
  }
}

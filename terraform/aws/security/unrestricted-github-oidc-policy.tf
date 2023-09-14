data "aws_iam_policy_document" "assume-policy-doc" {
  # ok: unrestricted-github-oidc-policy
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]

    principals {
      type        = "Federated"
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:oidc-provider/token.actions.githubusercontent.com"]
    }

    condition {
      test     = "StringLike"
      variable = "token.actions.githubusercontent.com:sub"

      values = [
        "repo:octocat/octocat-app:*",
      ]
    }
  }
}

data "aws_iam_policy_document" "assume-policy-doc-bad" {
  # ruleid: unrestricted-github-oidc-policy
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]

    principals {
      type        = "Federated"
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:oidc-provider/token.actions.githubusercontent.com"]
    }
  }
}
resource "aws_codebuild_project" "fail_1" {
  name         = "test-project"
  service_role = aws_iam_role.example.arn

  # ruleid: aws-codebuild-artifacts-unencrypted
  artifacts {
    encryption_disabled = true
    type                = "CODEPIPELINE"
  }

  environment {
    compute_type = "BUILD_GENERAL1_SMALL"
    image        = "aws/codebuild/standard:1.0"
    type         = "LINUX_CONTAINER"
  }

  source {
    type            = "GITHUB"
    location        = "https://github.com/mitchellh/packer.git"
    git_clone_depth = 1

    git_submodules_config {
      fetch_submodules = true
    }
  }
}

resource "aws_codebuild_project" "fail_2" {
  name         = "test-project"
  service_role = aws_iam_role.example.arn

  # ruleid: aws-codebuild-artifacts-unencrypted
  artifacts {
    encryption_disabled = true
    type                = "S3"
  }

  environment {
    compute_type = "BUILD_GENERAL1_SMALL"
    image        = "aws/codebuild/standard:1.0"
    type         = "LINUX_CONTAINER"
  }

  source {
    type            = "GITHUB"
    location        = "https://github.com/mitchellh/packer.git"
    git_clone_depth = 1

    git_submodules_config {
      fetch_submodules = true
    }
  }
}

resource "aws_codebuild_project" "fail_3" {
  name         = "test-project"
  service_role = aws_iam_role.example.arn

  # ruleid: aws-codebuild-artifacts-unencrypted
  artifacts {
    encryption_disabled = true
    type                = "CODEPIPELINE"
  }

  environment {
    compute_type = "BUILD_GENERAL1_SMALL"
    image        = "aws/codebuild/standard:1.0"
    type         = "LINUX_CONTAINER"
  }

  source {
    type            = "GITHUB"
    location        = "https://github.com/mitchellh/packer.git"
    git_clone_depth = 1

    git_submodules_config {
      fetch_submodules = true
    }
  }
}

resource "aws_codebuild_project" "fail_4" {
  name         = "test-project"
  service_role = aws_iam_role.example.arn

  # ruleid: aws-codebuild-artifacts-unencrypted
  artifacts {
    encryption_disabled = true
    type                = "S3"
  }

  environment {
    compute_type = "BUILD_GENERAL1_SMALL"
    image        = "aws/codebuild/standard:1.0"
    type         = "LINUX_CONTAINER"
  }

  source {
    type            = "GITHUB"
    location        = "https://github.com/mitchellh/packer.git"
    git_clone_depth = 1

    git_submodules_config {
      fetch_submodules = true
    }
  }
}

resource "aws_codebuild_project" "fail_5" {
  name         = "test-project"
  service_role = aws_iam_role.example.arn

  # ruleid: aws-codebuild-artifacts-unencrypted
  artifacts {
    encryption_disabled = true
    type                = "S3"
  }

  # ruleid: aws-codebuild-artifacts-unencrypted
  secondary_artifacts {
    artifact_identifier = "example-artifact-1"
    type                = "CODEPIPELINE"
    encryption_disabled = true
  }

  # ruleid: aws-codebuild-artifacts-unencrypted
  secondary_artifacts {
    artifact_identifier = "example-artifact-2"
    type                = "S3"
    encryption_disabled = true
  }

  environment {
    compute_type = "BUILD_GENERAL1_SMALL"
    image        = "aws/codebuild/standard:1.0"
    type         = "LINUX_CONTAINER"
  }

  source {
    type            = "GITHUB"
    location        = "https://github.com/mitchellh/packer.git"
    git_clone_depth = 1

    git_submodules_config {
      fetch_submodules = true
    }
  }
}

resource "aws_codebuild_project" "pass_fail" {
  name         = "test-project"
  service_role = aws_iam_role.example.arn

  # ok: aws-codebuild-artifacts-unencrypted
  artifacts {
    type                = "S3"
    encryption_disabled = false
  }

  # ok: aws-codebuild-artifacts-unencrypted
  secondary_artifacts {
    artifact_identifier = "example-artifact-1"
    type                = "CODEPIPELINE"
    encryption_disabled = false
  }

  # ruleid: aws-codebuild-artifacts-unencrypted
  secondary_artifacts {
    artifact_identifier = "example-artifact-1"
    type                = "CODEPIPELINE"
    encryption_disabled = true
  }

  # ok: aws-codebuild-artifacts-unencrypted
  secondary_artifacts {
    artifact_identifier = "example-artifact-3"
    type                = "S3"
    encryption_disabled = false
  }

  # ruleid: aws-codebuild-artifacts-unencrypted
  secondary_artifacts {
    artifact_identifier = "example-artifact-4"
    type                = "S3"
    encryption_disabled = true
  }

  environment {
    compute_type = "BUILD_GENERAL1_SMALL"
    image        = "aws/codebuild/standard:1.0"
    type         = "LINUX_CONTAINER"
  }

  source {
    type            = "GITHUB"
    location        = "https://github.com/mitchellh/packer.git"
    git_clone_depth = 1

    git_submodules_config {
      fetch_submodules = true
    }
  }
}

resource "aws_codebuild_project" "pass_1" {
  name         = "test-project"
  service_role = aws_iam_role.example.arn

  # ok: aws-codebuild-artifacts-unencrypted
  artifacts {
    type = "NO_ARTIFACTS"
  }

  environment {
    compute_type = "BUILD_GENERAL1_SMALL"
    image        = "aws/codebuild/standard:1.0"
    type         = "LINUX_CONTAINER"
  }

  source {
    type            = "GITHUB"
    location        = "https://github.com/mitchellh/packer.git"
    git_clone_depth = 1

    git_submodules_config {
      fetch_submodules = true
    }
  }
}

resource "aws_codebuild_project" "pass_2" {
  name         = "test-project"
  service_role = aws_iam_role.example.arn

  # ok: aws-codebuild-artifacts-unencrypted
  artifacts {
    type = "CODEPIPELINE"
  }

  environment {
    compute_type = "BUILD_GENERAL1_SMALL"
    image        = "aws/codebuild/standard:1.0"
    type         = "LINUX_CONTAINER"
  }

  source {
    type            = "GITHUB"
    location        = "https://github.com/mitchellh/packer.git"
    git_clone_depth = 1

    git_submodules_config {
      fetch_submodules = true
    }
  }
}

resource "aws_codebuild_project" "pass_3" {
  name         = "test-project"
  service_role = aws_iam_role.example.arn

  # ok: aws-codebuild-artifacts-unencrypted
  artifacts {
    type = "S3"
  }

  environment {
    compute_type = "BUILD_GENERAL1_SMALL"
    image        = "aws/codebuild/standard:1.0"
    type         = "LINUX_CONTAINER"
  }

  source {
    type            = "GITHUB"
    location        = "https://github.com/mitchellh/packer.git"
    git_clone_depth = 1

    git_submodules_config {
      fetch_submodules = true
    }
  }
}

resource "aws_codebuild_project" "pass_4" {
  name         = "test-project"
  service_role = aws_iam_role.example.arn

  # ok: aws-codebuild-artifacts-unencrypted
  artifacts {
    type                = "CODEPIPELINE"
    encryption_disabled = false
  }

  environment {
    compute_type = "BUILD_GENERAL1_SMALL"
    image        = "aws/codebuild/standard:1.0"
    type         = "LINUX_CONTAINER"
  }

  source {
    type            = "GITHUB"
    location        = "https://github.com/mitchellh/packer.git"
    git_clone_depth = 1

    git_submodules_config {
      fetch_submodules = true
    }
  }
}

resource "aws_codebuild_project" "pass_5" {
  name         = "test-project"
  service_role = aws_iam_role.example.arn

  # ok: aws-codebuild-artifacts-unencrypted
  artifacts {
    encryption_disabled = false
    type                = "S3"
  }

  environment {
    compute_type = "BUILD_GENERAL1_SMALL"
    image        = "aws/codebuild/standard:1.0"
    type         = "LINUX_CONTAINER"
  }

  source {
    type            = "GITHUB"
    location        = "https://github.com/mitchellh/packer.git"
    git_clone_depth = 1

    git_submodules_config {
      fetch_submodules = true
    }
  }
}

resource "aws_codebuild_project" "pass_6" {
  name         = "test-project"
  service_role = aws_iam_role.example.arn

  # ok: aws-codebuild-artifacts-unencrypted
  artifacts {
    type = "S3"
  }

  # ok: aws-codebuild-artifacts-unencrypted
  secondary_artifacts {
    artifact_identifier = "example-artifact-1"
    type                = "CODEPIPELINE"
  }

  # ok: aws-codebuild-artifacts-unencrypted
  secondary_artifacts {
    artifact_identifier = "example-artifact-2"
    type                = "CODEPIPELINE"
    encryption_disabled = false
  }

  # ok: aws-codebuild-artifacts-unencrypted
  secondary_artifacts {
    artifact_identifier = "example-artifact-3"
    type                = "S3"
  }

  # ok: aws-codebuild-artifacts-unencrypted
  secondary_artifacts {
    artifact_identifier = "example-artifact-4"
    type                = "S3"
    encryption_disabled = false
  }

  environment {
    compute_type = "BUILD_GENERAL1_SMALL"
    image        = "aws/codebuild/standard:1.0"
    type         = "LINUX_CONTAINER"
  }

  source {
    type            = "GITHUB"
    location        = "https://github.com/mitchellh/packer.git"
    git_clone_depth = 1

    git_submodules_config {
      fetch_submodules = true
    }
  }
}

# pass

resource "aws_lb" "enabled" {
  internal           = false
  load_balancer_type = "application"
  name               = "alb"
  subnets            = var.public_subnet_ids

  enable_deletion_protection = true
}

resource "aws_alb" "enabled" {
  internal           = false
  load_balancer_type = "application"
  name               = "alb"
  subnets            = var.public_subnet_ids

  enable_deletion_protection = true
}

# failure
<<<<<<< HEAD
# ruleid: missing-aws-lb-deletion-protection
=======

>>>>>>> refs/remotes/origin/migrated-checkov-rules
resource "aws_lb" "default" {
  internal           = false
  load_balancer_type = "application"
  name               = "alb"
  subnets            = var.public_subnet_ids
}
<<<<<<< HEAD
# ruleid: missing-aws-lb-deletion-protection
=======

>>>>>>> refs/remotes/origin/migrated-checkov-rules
resource "aws_alb" "default" {
  internal           = false
  load_balancer_type = "application"
  name               = "alb"
  subnets            = var.public_subnet_ids
}
<<<<<<< HEAD
# ruleid: missing-aws-lb-deletion-protection
=======

>>>>>>> refs/remotes/origin/migrated-checkov-rules
resource "aws_lb" "disabled" {
  internal           = false
  load_balancer_type = "application"
  name               = "alb"
  subnets            = var.public_subnet_ids

  enable_deletion_protection = false
}
<<<<<<< HEAD
# ruleid: missing-aws-lb-deletion-protection
=======

>>>>>>> refs/remotes/origin/migrated-checkov-rules
resource "aws_alb" "disabled" {
  internal           = false
  load_balancer_type = "application"
  name               = "alb"
  subnets            = var.public_subnet_ids

  enable_deletion_protection = false
}

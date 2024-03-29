/**
 * # ![AWS](aws-logo.png) IAM Role
 *
 * [![CI](https://github.com/figurate/terraform-aws-iam-role/actions/workflows/main.yml/badge.svg)](https://github.com/figurate/terraform-aws-iam-role/actions/workflows/main.yml)
 *
 *
 * ![AWS IAM Role](aws_iam_role.png)
 *
 * Purpose: Provision IAM Role in AWS.
 *
 * Rationale: Apply standards and constraints to IAM Roles.
 */
data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      identifiers = [local.principals[var.principal][0]]
      type        = local.principals[var.principal][1]
    }
  }
}

data "aws_iam_policy_document" "assume_role_policy_with_roles" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      identifiers = [local.principals[var.principal][0]]
      type        = local.principals[var.principal][1]
    }
  }
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      identifiers = var.principal_roles
      type        = "AWS"
    }
  }
}

data "aws_iam_policy" "inline_policies" {
  count = length(var.inline_policies)
  arn   = var.inline_policies[count.index]
}

resource "aws_iam_role" "role" {
  name                 = var.name
  description          = var.description
  path                 = var.path
  assume_role_policy   = length(var.principal_roles) > 0 ? data.aws_iam_policy_document.assume_role_policy_with_roles.json : data.aws_iam_policy_document.assume_role_policy.json
  permissions_boundary = var.permissions_boundary
}

resource "aws_iam_role_policy_attachment" "attached_policies" {
  count      = length(var.policies)
  policy_arn = var.policies[count.index]
  role       = aws_iam_role.role.name
}

resource "aws_iam_role_policy" "inline_policies" {
  count  = length(var.inline_policies)
  policy = data.aws_iam_policy.inline_policies[count.index].policy
  name   = data.aws_iam_policy.inline_policies[count.index].name
  role   = aws_iam_role.role.name
}

/**
 * # ![AWS](aws-logo.png) IAM Role
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

resource "aws_iam_role" "role" {
  name               = var.name
  description        = var.description
  path               = var.path
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
}

resource "aws_iam_role_policy_attachment" "attached_policies" {
  count      = length(var.policies)
  policy_arn = var.policies[count.index]
  role       = aws_iam_role.role.name
}

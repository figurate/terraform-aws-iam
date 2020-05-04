data "aws_iam_policy_document" "cloudformation_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      identifiers = ["cloudformation.amazonaws.com"]
      type        = "Service"
    }
  }
}

resource "aws_iam_role" "cloudformation" {
  name               = var.name
  description        = var.description
  path               = var.role_path
  assume_role_policy = data.aws_iam_policy_document.cloudformation_assume_role_policy.json
}

resource "aws_iam_role_policy_attachment" "attached_policies" {
  for_each   = var.policies
  policy_arn = each.value
  role       = aws_iam_role.cloudformation.name
}

module "ec2_role" {
  source = "../.."

  name                 = var.name
  description          = var.description
  path                 = var.path
  principal            = "ec2"
  principal_roles      = var.principal_roles
  permissions_boundary = var.permissions_boundary
  policies             = var.policies
  inline_policies      = var.inline_policies
}

resource "aws_iam_instance_profile" "ec2_role" {
  name = var.name
  role = module.ec2_role.role_name
}

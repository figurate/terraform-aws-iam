module "ec2_role" {
  source = "../.."

  name                 = var.name
  description          = var.description
  path                 = var.path
  principal            = "ec2"
  permissions_boundary = var.permissions_boundary
  policies             = var.policies
}
module "codedeploy_role" {
  source = "../.."

  name                 = var.name
  description          = var.description
  path                 = var.path
  principal            = "codedeploy"
  permissions_boundary = var.permissions_boundary
  policies             = var.policies
}
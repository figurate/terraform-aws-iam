module "cloudformation_role" {
  source = "../.."

  name                 = var.name
  description          = var.description
  path                 = var.path
  principal            = "cloudformation"
  principal_roles      = var.principal_roles
  permissions_boundary = var.permissions_boundary
  policies             = var.policies
  inline_policies      = var.inline_policies
}
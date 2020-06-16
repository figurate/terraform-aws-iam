module "account_role" {
  source = "../.."

  name                 = var.name
  description          = var.description
  path                 = var.path
  principal            = "account"
  permissions_boundary = var.permissions_boundary
  policies             = var.policies
}
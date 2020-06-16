module "lambda_role" {
  source = "../.."

  name                 = var.name
  description          = var.description
  path                 = var.path
  principal            = "lambda"
  permissions_boundary = var.permissions_boundary
  policies             = var.policies
}
module "lambda_role" {
  source = "../.."

  name = var.name
  description = var.description
  path = var.path
  principal = "lambda"
  policies = var.policies
}
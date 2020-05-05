module "account_role" {
  source = "../.."

  name = var.name
  description = var.description
  path = var.path
  principal = "account"
  policies = var.policies
}
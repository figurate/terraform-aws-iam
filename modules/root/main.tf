module "account_root_role" {
  source = "../.."

  name = var.name
  description = var.description
  path = var.path
  principal = "root"
  policies = var.policies
}
module "edgelambda_role" {
  source = "../.."

  name = var.name
  description = var.description
  path = var.path
  principal = "edgelambda"
  policies = var.policies
}
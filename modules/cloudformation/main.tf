module "cloudformation_role" {
  source = "../.."

  name = var.name
  description = var.description
  path = var.path
  principal = "cloudformation"
  policies = var.policies
}
module "codedeploy_role" {
  source = "../.."

  name = var.name
  description = var.description
  path = var.path
  principal = "codedeploy"
  policies = var.policies
}
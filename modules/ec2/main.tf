module "ec2_role" {
  source = "../.."

  name = var.name
  description = var.description
  path = var.path
  principal = "ec2"
  policies = var.policies
}
module "spotfleet_role" {
  source = "../.."

  name = var.name
  description = var.description
  path = var.path
  principal = "spotfleet"
  policies = var.policies
}
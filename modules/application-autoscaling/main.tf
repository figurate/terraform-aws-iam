module "autoscaling_role" {
  source = "../.."

  name                 = var.name
  description          = var.description
  path                 = var.path
  principal            = "application-autoscaling"
  permissions_boundary = var.permissions_boundary
  policies             = var.policies
}
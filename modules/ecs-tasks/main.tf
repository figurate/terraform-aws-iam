module "ecs_role" {
  source = "../.."

  name                 = var.name
  description          = var.description
  path                 = var.path
  principal            = "ecs-tasks"
  permissions_boundary = var.permissions_boundary
  policies             = var.policies
}
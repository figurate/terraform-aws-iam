module "ecs_role" {
  source = "../.."

  name        = var.name
  description = var.description
  path        = var.path
  principal   = "ecs-tasks"
  policies    = var.policies
}
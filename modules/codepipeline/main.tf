module "codepipeline_role" {
  source = "../.."

  name                 = var.name
  description          = var.description
  path                 = var.path
  principal            = "codepipeline"
  permissions_boundary = var.permissions_boundary
  policies             = var.policies
}
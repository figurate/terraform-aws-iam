module "codebuild_role" {
  source = "../.."

  name                 = var.name
  description          = var.description
  path                 = var.path
  principal            = "codebuild"
  permissions_boundary = var.permissions_boundary
  policies             = var.policies
}
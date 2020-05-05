module "codebuild_role" {
  source = "../.."

  name = var.name
  description = var.description
  path = var.path
  principal = "codebuild"
  policies = var.policies
}
module "codepipeline_role" {
  source = "../.."

  name = var.name
  description = var.description
  path = var.path
  principal = "codepipeline"
  policies = var.policies
}
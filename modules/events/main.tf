module "events_role" {
  source = "../.."

  name        = var.name
  description = var.description
  path        = var.path
  principal   = "events"
  policies    = var.policies
}
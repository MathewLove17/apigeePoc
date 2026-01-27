locals {
  apigee_required_apis = toset([
    "apigee.googleapis.com",
    "apigeeconnect.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "monitoring.googleapis.com",
    "pubsub.googleapis.com",
  ])
}

resource "google_project_service" "apigee_apis" {
  for_each = local.apigee_required_apis

  project = var.gcp_project_id
  service = each.value

  disable_on_destroy = false
}

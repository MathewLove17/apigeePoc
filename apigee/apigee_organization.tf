resource "google_apigee_organization" "hybrid_org" {
  project_id       = var.gcp_project_id
  analytics_region = var.analytics_region
  runtime_type     = "HYBRID"
}

resource "google_apigee_envgroup" "envgroup" {
  org_id     = google_apigee_organization.hybrid_org.id
  name       = var.apigee_envgroup
  hostnames  = var.apigee_hostnames
}

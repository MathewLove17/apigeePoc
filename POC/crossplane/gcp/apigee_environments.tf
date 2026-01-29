resource "google_apigee_environment" "env" {
  
  org_id = google_apigee_organization.hybrid_org.id
  name   = var.apigee_environment
}

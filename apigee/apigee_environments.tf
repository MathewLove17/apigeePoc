resource "google_apigee_environment" "env" {
  org_id = var.gcp_project_id
  name   = var.apigee_environment

 depends_on = [
    google_apigee_organization.hybrid_org
  ]
}
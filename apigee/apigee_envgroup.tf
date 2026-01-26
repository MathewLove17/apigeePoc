resource "google_apigee_envgroup" "envgroup" {
  org_id = var.gcp_project_id
  name   = var.apigee_envgroup

  hostnames = var.apigee_hostnames
  depends_on = [
        google_apigee_organization.hybrid_org
    ]
}

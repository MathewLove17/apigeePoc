resource "google_apigee_environment" "env" {
  # MUY importante: usar el ID de la org para que el provider forme bien la URL
  org_id = google_apigee_organization.hybrid_org.id
  name   = var.apigee_environment
}

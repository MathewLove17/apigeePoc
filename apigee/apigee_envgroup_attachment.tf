resource "google_apigee_envgroup_attachment" "attachment" {
  org_id          = var.gcp_project_id
  envgroup_id     = google_apigee_envgroup.envgroup.name
  environment_id  = google_apigee_environment.env.name
   depends_on = [
    google_apigee_environment.env
  ]
}

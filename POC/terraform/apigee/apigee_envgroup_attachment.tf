resource "google_apigee_envgroup_attachment" "attachment" {
  envgroup_id  = google_apigee_envgroup.envgroup.id
  environment  = var.apigee_environment

  depends_on = [
    time_sleep.wait_for_env_and_envgroup
  ]
}

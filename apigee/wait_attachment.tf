resource "time_sleep" "wait_for_env_and_envgroup" {
  depends_on = [
    google_apigee_environment.env,
    google_apigee_envgroup.envgroup
  ]

  create_duration = "300s"
}

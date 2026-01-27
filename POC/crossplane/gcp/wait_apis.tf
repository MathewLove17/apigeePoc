resource "time_sleep" "wait_for_gcp_services" {
  depends_on = [
    google_project_service.apigee_apis
  ]

  # Ajusta si tu org tarda más: "120s"
  create_duration = "300s"
}

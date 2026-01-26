output "enabled_apis" {
  value = [for s in google_project_service.apigee_apis : s.service]
}

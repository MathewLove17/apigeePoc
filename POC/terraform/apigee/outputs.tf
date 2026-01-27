output "org_id" {
  value = google_apigee_organization.hybrid_org.id
}

output "environment" {
  value = google_apigee_environment.env.name
}

output "envgroup" {
  value = google_apigee_envgroup.envgroup.name
}

output "envgroup_hostnames" {
  value = google_apigee_envgroup.envgroup.hostnames
}

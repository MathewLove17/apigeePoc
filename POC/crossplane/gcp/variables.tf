variable "gcp_project_id" {
  type        = string
  description = "Project ID de GCP (y también ORG_NAME en Apigee)."
}

variable "analytics_region" {
  type        = string
  description = "Región para Apigee Analytics (ej: europe-west1)."
}

variable "apigee_environment" {
  type        = string
  description = "Nombre del environment (ej: test)."
}

variable "apigee_envgroup" {
  type        = string
  description = "Nombre del envgroup (ej: hybrid-group)."
}

variable "apigee_hostnames" {
  type        = string
  description = "Lista JSON de hostnames del envgroup (ej: [\"api.example.com\"])."
}

variable "gcp_credentials_file" {
  type        = string
  description = "Ruta al JSON del service account"
}

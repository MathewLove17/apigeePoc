variable "gcp_project_id" {
  type        = string
  description = "ID del proyecto de GCP donde se habilitan las APIs para Apigee hybrid."
}
variable "analytics_region" {
  type        = string
  description = "Región para Apigee Analytics (ej: europe-west1)."
}
variable "apigee_environment" {
  description = "Nombre del environment de Apigee"
  type        = string
}

variable "apigee_envgroup" {
  description = "Nombre del environment group"
  type        = string
}

variable "apigee_hostnames" {
  description = "Lista de hostnames para el environment group"
  type        = list(string)
}
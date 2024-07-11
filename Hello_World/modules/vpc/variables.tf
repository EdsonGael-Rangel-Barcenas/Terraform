variable "project_id" {
  description = "El ID del proyecto en GCP"
  type        = string
}

variable "region" {
  description = "La región donde se desplegará la VPC"
  type        = string
}

variable "network_name" {
  description = "El nombre de la VPC"
  type        = string
}

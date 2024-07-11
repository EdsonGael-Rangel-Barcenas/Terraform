variable "project_id" {
  description = "El ID del proyecto en GCP"
  type        = string
}

variable "region" {
  description = "La región donde se desplegará la subred"
  type        = string
}

variable "subnet_name" {
  description = "El nombre de la subred"
  type        = string
}

variable "subnet_cidr" {
  description = "El CIDR de la subred"
  type        = string
}

variable "network_name" {
  description = "El nombre de la VPC"
  type        = string
}

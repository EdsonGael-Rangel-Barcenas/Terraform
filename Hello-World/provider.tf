provider "google" {
}

variable "project_id" {
  description = "El ID del proyecto en GCP"
  type        = string
  default     = "mx-thinkcare-architecture-lab"
}

variable "region" {
  description = "La región donde se desplegarán los recursos"
  type        = string
  default     = "us-central1"
}
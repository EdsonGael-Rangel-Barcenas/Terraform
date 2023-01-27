provider "google" {
    terraform {
  required_providers {
    google  = {
      source = "hashicorp/google"

  # Establecer las credenciales para la autenticación
  project = ${var.project_id }
  region  = ${var.region}
  zone    = ${var.zone}
  service_account	= ${var.service_account}
  request_timeout 	= "60s"

      }
    }
  }
}
provider "google" {
  credentials = file("${credenciales.json}")
  project     = ${var.project_name}
  region      = ${var.region}
}
provider "google" {
  credentials = file("${credenciales.json}")
  project     = ${var.nombre_del_proyecto}
  region      = ${var.region}
}

resource "google_storage_bucket" "ejemplo_bucket" {
  name = ${var.nombre_bucket}
}

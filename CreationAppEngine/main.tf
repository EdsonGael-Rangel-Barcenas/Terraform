//Main.tf
//Configure el proveedor de Google
provider "google" {
  credentials = file("credentials.json")
  project     = var.project_id
  region      = "us-central1"
}

//Crea la aplicación de App Engine
resource "google_app_engine_application" "app" {
  project = var.project_id
  location_id = "us-central"
  name = "my-app"
}

//Crea una instancia de App Engine
resource "google_app_engine_standard_app_version" "version" {
  project    = var.project_id
  location_id = "us-central"
  name       = "v1"
  instance_class = "F1"
  runtime    = "go111"
  source_code_bucket = "my-bucket-name"
  source_code_object = "my-source-code.zip"
}
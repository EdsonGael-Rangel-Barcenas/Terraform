provider "google" {
  project = var.project
  region  = var.region
  credentials = file("credentials.json")
}

resource "google_sql_database_instance" "default" {
  name              = "demo-instance"
  region            = var.region
  settings {
    tier              = "db-n1-standard-1"
    activation_policy = "ALWAYS"
  }
}
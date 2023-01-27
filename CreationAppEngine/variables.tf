//variables.tf
variable "project_id" {
  description = "The project ID to deploy to."
}

outputs.tf

//outputs.tf
output "app_url" {
  value = google_app_engine_application.app.default_hostname
}   
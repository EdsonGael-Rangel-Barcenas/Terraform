/*Creación de balanceador de carga HTTP para GCP con Terraform*/

provider "google" {
  project = var.project
  region  = var.region
}

resource "google_compute_health_check" "http" {
  name               = "http-basic-check"
  check_interval_sec = 1
  timeout_sec        = 1
  healthy_threshold  = 2
  unhealthy_threshold = 2
  http_health_check   {
    port = 80
    request_path = "/"
  }
}

resource "google_compute_backend_service" "default" {
  name    = "default-backend"
  health_checks = [google_compute_health_check.http.name]
}

resource "google_compute_url_map" "default" {
  name        = "default-url-map"
  default_service = google_compute_backend_service.default.self_link
}

resource "google_compute_target_http_proxy" "default" {
  name    = "default-target-http-proxy"
  url_map = google_compute_url_map.default.self_link
}

resource "google_compute_global_forwarding_rule" "default" {
  name        = "default-forwarding-rule"
  target      = google_compute_target_http_proxy.default.self_link
  port_range  = "80"
  ip_protocol = "TCP"
}
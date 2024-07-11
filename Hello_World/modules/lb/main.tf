resource "google_compute_global_address" "default" {
  project = var.project_id
  name       = "lb-ipv4-1"
  ip_version = "IPV4"
}

resource "google_compute_health_check" "default" {
  project = var.project_id
  name               = "http-basic-check"
  check_interval_sec = 5
  healthy_threshold  = 2
  http_health_check {
    port               = 80
    port_specification = "USE_FIXED_PORT"
    proxy_header       = "NONE"
    request_path       = "/"
  }
  timeout_sec         = 5
  unhealthy_threshold = 2
}

resource "google_compute_backend_service" "default" {
  project = var.project_id
  name                            = "web-backend-service"
  connection_draining_timeout_sec = 0
  health_checks                   = [google_compute_health_check.default.id]
  load_balancing_scheme           = "EXTERNAL_MANAGED"
  port_name                       = "http"
  protocol                        = "HTTP"
  session_affinity                = "NONE"
  timeout_sec                     = 30
  
  backend {
    group           = var.instance_group
    balancing_mode  = "UTILIZATION"
    capacity_scaler = 1.0
    
  }
}

resource "google_compute_url_map" "default" {
  project = var.project_id
  name            = "web-map-http"
  default_service = google_compute_backend_service.default.id
}

#create the target HTTP proxy
resource "google_compute_target_http_proxy" "default" {
  project = var.project_id
  name    = "http-lb-proxy"
  url_map = google_compute_url_map.default.id
}

# create the forwarding rule
resource "google_compute_global_forwarding_rule" "default" {
    project = var.project_id
  name                  = "http-content-rule"
  ip_protocol           = "TCP"
  load_balancing_scheme = "EXTERNAL_MANAGED"
  port_range            = "80-80"
  target                = google_compute_target_http_proxy.default.id
  ip_address            = google_compute_global_address.default.id
}
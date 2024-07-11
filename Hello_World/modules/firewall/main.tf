resource "google_compute_firewall" "firewall" {
  project = var.project_id
  for_each = { for rule in var.firewall_rules : rule.name => rule }

  name    = each.value.name
  network = var.network_name

  direction = each.value.direction
  priority  = each.value.priority

  allow {
    protocol = each.value.allow_ports[0].protocol
    ports    = each.value.allow_ports[0].ports
  }

  source_ranges = each.value.ranges
}

provider "google" {
  project = var.project_id
}

resource "google_compute_firewall" "health_check_firewall" {
  name    = "${var.health_check_name}-firewall-rule"
  network = var.network_name

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["130.211.0.0/22", "35.191.0.0/16"]
}

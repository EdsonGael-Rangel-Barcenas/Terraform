provider "google" {
  project = var.project_name
  region  = var.region
  credentials = file("${var.credentials_file_path}")
}

resource "google_compute_network" "default" {
  name                    = var.network_name
  auto_create_subnetworks = true
}

resource "google_compute_subnetwork" "public" {
  name          = var.subnetwork_name
  ip_cidr_range = var.ip_cidr_range
  network       = google_compute_network.default.self_link
}

resource "google_compute_firewall" "firewall_rule" {
  name    = var.firewall_rule_name
  network = google_compute_network.default.name
  allow {
    protocol = "icmp"
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["${var.target_tags}"]
}

resource "google_compute_instance" "gke_node" {
  name         = "gke-node"
  machine_type = var.machine_type

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1804-lts"
    }
  }

  network_interface {
    network    = google_compute_network.default.name
    subnetwork = google_compute_subnetwork.public.name
  }

  metadata = {
    ssh-keys = "user:ssh-key"
  }

  service_account {
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }
}
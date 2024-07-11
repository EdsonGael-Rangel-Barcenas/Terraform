resource "google_compute_subnetwork" "subnet" {
  project = var.project_id
  name          = var.subnet_name
  ip_cidr_range = var.subnet_cidr
  network       = var.network_name
  region        = var.region
}

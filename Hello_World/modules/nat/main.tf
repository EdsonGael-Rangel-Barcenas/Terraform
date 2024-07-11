resource "google_compute_address" "ip_address_for_nat" {
    project = var.project_id
    region = var.region
    name    = var.cloud_nat_ip_name
}

resource "google_compute_router_nat" "cloud_nat" {
  project = var.project_id
  name   = var.nat_name
  router = var.router_name
  region = var.region
  
  nat_ip_allocate_option = "MANUAL_ONLY"
  nat_ips                = [google_compute_address.ip_address_for_nat.name]

  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}
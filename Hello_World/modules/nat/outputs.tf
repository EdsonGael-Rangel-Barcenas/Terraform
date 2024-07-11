output "cloud_nat_name" {
  value = google_compute_router_nat.cloud_nat.name
}
output "cloud_nat_ip" {
  value = google_compute_address.ip_address_for_nat.address
}
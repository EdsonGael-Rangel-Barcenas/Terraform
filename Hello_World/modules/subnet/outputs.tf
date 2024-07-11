output "subnet_name" {
  description = "El nombre de la subred"
  value       = google_compute_subnetwork.subnet.name
}

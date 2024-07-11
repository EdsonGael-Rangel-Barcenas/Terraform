output "network_name" {
  description = "El nombre de la VPC"
  value       = google_compute_network.vpc.name
}

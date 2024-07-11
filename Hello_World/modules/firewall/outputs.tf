output "firewall_rule_names" {
  description = "Los nombres de las reglas de firewall"
  value       = [for rule in google_compute_firewall.firewall : rule.name]
}

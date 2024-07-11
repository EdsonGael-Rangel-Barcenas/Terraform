output "vpc_name" {
  value = module.vpc.network_name
}

output "subnet_name" {
  value = module.subnet.subnet_name
}

output "firewall_rule_names" {
  value = module.firewall.firewall_rule_names
}

output "router_name" {
  value = module.router.router_name
}

output "cloud_nat_ip" {
  value = module.nat.cloud_nat_ip
}


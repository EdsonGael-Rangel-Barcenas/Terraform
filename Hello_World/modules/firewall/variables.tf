variable "project_id" {
  description = "El ID del proyecto en GCP"
  type        = string
}

variable "network_name" {
  description = "El nombre de la VPC"
  type        = string
}

variable "firewall_rules" {
  description = "Reglas del firewall"
  type        = list(object({
    name       = string
    direction  = string
    priority   = number
    ranges     = list(string)
    allow_ports = list(object({
      protocol = string
      ports    = list(string)
    }))
  }))
  default = []
}

variable "health_check_name" {
  description = "El nombre del health check"
  type        = string
}

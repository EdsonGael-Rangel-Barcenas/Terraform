variable "project_id" {
  description = "El ID del proyecto en GCP"
  type        = string
}

variable "region" {
  description = "La región donde se desplegará la máquina virtual"
  type        = string
}
variable "startup_script" {
  description = "El script de inicio que se ejecutará en la instancia"
  type        = string
  default     = ""
}

variable "instance_type" {
  description = "El tipo de la máquina virtual"
  type        = string
}

variable "subnet_name" {
  description = "El nombre de la subred"
  type        = string
}

variable "network_name" {
  description = "El nombre de la VPC"
  type        = string
}

variable "template_name" {
  type = string
}
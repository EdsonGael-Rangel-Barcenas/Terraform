variable "project_name" {
  default = "my-project"
}

variable "region" {
  default = "us-central1"
}

variable "credentials_file_path" {
  default = "~/.gcloud/credentials.json"
}

variable "network_name" {
  default = "my-network"
}

variable "subnetwork_name" {
  default = "my-subnetwork"
}

variable "ip_cidr_range" {
  default = "10.0.0.0/16"
}

variable "firewall_rule_name" {
  default = "my-firewall-rule"
}

variable "target_tags" {
  default = ["gke"]
}

variable "machine_type" {
  default = "f1-micro"
}
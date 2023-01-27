variable "project_id" {
  type    = string
  default = "project_id"
}

variable "region" {
  type    = string
  default = "us-central1"
}

variable "zone" {
  type    = string
  default = "uscentral1-a"
}

variable "machine_type" {
  type    = string
  default = "f1-micro"
}

variable "disk_size" {
  type    = number
  default = 15
}

variable "disk_type" {
  type    = string
  default = "pd-standard"
}

variable "disk_image" {
  type    = string
  default = "disk_image"
}

variable "service_account" {
  type    = string
  default = "google_service_account"
}


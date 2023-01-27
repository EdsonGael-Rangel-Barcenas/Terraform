variable "project" {
  type    = string
  default = "<PROJECT_ID>"
}

variable "region" {
  type    = string
  default = "<REGION>"
}

variable "zone" {
  type    = string
  default = "<ZONE>"
}

variable "tier" {
  type    = string
  default = "<TIER>"
}

variable "capacity" {
  type    = number
  default = "<CAPACITY>"
}

variable "network" {
  type    = string
  default = "<NETWORK>"
}

variable "authorized_networks" {
  type    = list(string)
  default = [
    "<AUTHORIZED_NETWORKS>"
  ]
}

variable "instance_name" {
  type    = string
  default = "<INSTANCE_NAME>"
}

variable "member" {
  type    = string
  default = "<MEMBER>"
}

variable "ip_address" {
  type    = string
  default = "<IP_ADDRESS>"
}

variable "file_share_name" {
  type    = string
  default = "<FILE_SHARE_NAME>"
}

variable "username" {
  type    = string
  default = "<USERNAME>"
}

variable "password" {
  type    = string
  default = "<PASSWORD>"
}

variable "uid" {
  type    = number
  default = "<UID>"
}

variable "users" {
  type    = list(string)
  default = [
    "<USERS>"
  ]
}

variable "roles" {
  type    = list(string)
  default = [
    "<ROLES>"
  ]
}

variable "folder_name" {
  type    = string
  default = "<FOLDER_NAME>"
}

variable "source_path" {
  type    = string
  default = "<SOURCE_PATH>"
}

variable "routes" {
  type    = list(string)
  default = [
    "<ROUTES>"
  ]
}
// Configuración de proveedor
provider "google" {
  project = var.project
  region  = var.region
  version = "~> 3.0"
}

// Creación del recurso de filestore
resource "google_filestore_instance" "example" {
  name               = var.instance_name
  zone               = var.zone
  tier               = var.tier
  capacity_gb        = var.capacity
  network            = var.network
  authorized_networks = var.authorized_networks
}

// Creación de la unidad
resource "google_filestore_instance_iam_member" "example" {
  instance      = google_filestore_instance.example.name
  project       = google_filestore_instance.example.project
  role          = "roles/filestore.admin"
  member        = var.member
}

// Creación del punto de montaje
resource "google_filestore_mount_target" "example" {
  instance        = google_filestore_instance.example.name
  ip_address      = var.ip_address
  file_share_name = var.file_share_name
  network         = var.network
}

// Creación del recurso de usuario
resource "google_filestore_user" "example" {
  instance_name = google_filestore_instance.example.name
  username      = var.username
  password      = var.password
  uid           = var.uid
}

// Creación de la política de acceso
resource "google_filestore_access_policy" "example" {
  instance_name = google_filestore_instance.example.name
  users         = var.users
  roles         = var.roles
}

// Creación del recurso de carpeta
resource "google_filestore_folder" "example" {
  instance_name = google_filestore_instance.example.name
  folder_name   = var.folder_name
  source_path   = var.source_path
}

// Creación del recurso de compartición de archivos
resource "google_filestore_file_share" "example" {
  instance_name = google_filestore_instance.example.name
  file_share_name = var.file_share_name
  capacity_gb   = var.capacity
  routes        = var.routes
}
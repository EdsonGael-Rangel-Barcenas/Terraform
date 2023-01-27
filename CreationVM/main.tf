resource "google_compute_instance" "default" {
  name         = "example-instance"
  machine_type = var.machine_type
  zone         = var.zone

  tags = ["terraform-example"]

  boot_disk {
    initialize_params {
      image = var.disk_image
    }
    size = var.disk_size
    type = var.disk_type
  }

  network_interface {
    network = "default"
  }

}

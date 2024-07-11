resource "google_compute_instance_group_manager" "instance_group" {
  project = var.project_id
  name = var.ig_name
  zone = "${var.region}-a"
  named_port {
    name = "http"
    port = 80
  }
  version {
    instance_template = var.template_name
    name              = "primary"
  }
  base_instance_name = "vm"
  target_size        = 2
}
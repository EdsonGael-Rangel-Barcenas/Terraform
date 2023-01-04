provider "google" {
  project = "ghdz-grupo-ad-poc"
  region  = "us-central1"
}

resource "google_compute_instance" "virtualmachine" {
  name         = "vm-terraform"
  machine_type = "f1-micro"
  zone         = "us-central1-a"
  tags         = ["iap"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      size  = 20
    }
  }

  network_interface {
    network = "projects/ghdz-grupo-int-shdvpc-poc/global/networks/ghdz-internal-vpc-poc"
    subnetwork = "projects/ghdz-grupo-int-shdvpc-poc/regions/us-central1/subnetworks/ghdz-internal-us-central1-a-subnet-poc"
  }

  metadata = {
    disable-external-ip = "true"
  }
}
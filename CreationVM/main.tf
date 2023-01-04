# Este es un archivo de configuracion y creacion de una maquina virtualmachine con las siguientes caracteristicas
# Va a ser una maquina vurtual muy pequeña con  Procesador: La máquina virtual F1-micro tiene un solo núcleo de procesador y 0,2 vCPUs.
//lmacenamiento: La máquina virtual F1-micro tiene un disco duro SSD de 10 GB.
//Memoria: La máquina virtual F1-micro tiene 0,6 GB de memoria RAM.
//Taifas: La máquina virtual F1-micro está en la tarifa "Precios bajos y estables". Esto significa que tiene un precio más bajo que otras máquinas virtuales, pero también tiene un rendimiento más bajo.
//Uso: La máquina virtual F1-micro es adecuada para tareas que no requieren muchos recursos de procesamiento o para pruebas y desarrollo. No es adecuada para cargas de trabajo que requieren procesamiento de alto rendimiento.
//Red: La máquina virtual F1-micro tiene un ancho de banda de entrada y salida de 1 Gbps.
//Soporte para GPU: La máquina virtual F1-micro no tiene soporte para procesadores gráficos (GPUs).
# Ademas esta configurada con una VPC comportida
# Y con una ip interna y bloquando la IP Externa

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
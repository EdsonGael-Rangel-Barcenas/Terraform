module "vpc" {
  source       = "./modules/vpc"
  project_id   = var.project_id
  region       = var.region
  network_name = "my-vpc"
}

module "subnet" {
  source       = "./modules/subnet"
  project_id   = var.project_id
  region       = var.region
  subnet_name  = "my-subnet"
  subnet_cidr  = "10.0.0.0/24"
  network_name = module.vpc.network_name
}

module "router" {
  source       = "./modules/router"
  project_id = var.project_id
  region = var.region
  router_name = "my-router"
  network_name = module.vpc.network_name
}


module "nat" {
  source       = "./modules/nat"
  project_id   = var.project_id
  region       = var.region
  nat_name = "nat-internet"
  cloud_nat_ip_name = "sip-nat"
  router_name = module.router.router_name
}

module "instance_template" {
  source         = "./modules/instance_template"
  project_id     = var.project_id
  region         = var.region
  instance_type  = "n1-standard-1"
  template_name = "lb-backend-template"
  subnet_name    = module.subnet.subnet_name
  network_name   = module.vpc.network_name
  startup_script = <<-EOF
    #!/bin/bash
    sudo apt-get update
    sudo apt-get install -y apache2
    echo '<!DOCTYPE html><html><body><h1>Hello, World!</h1></body></html>' > /var/www/html/index.html
    sudo systemctl start apache2
    sudo systemctl enable apache2
  EOF
}

module "instance_group" {
  source = "./modules/instance_group"
  project_id     = var.project_id
  ig_name = "lb-backend-example"
  region = var.region
  template_name = module.instance_template.template_name
}

module "firewall" {
  source       = "./modules/firewall"
  project_id   = var.project_id
  network_name = module.vpc.network_name
  firewall_rules = [
    {
      name      = "allow-ssh"
      direction = "INGRESS"
      priority  = 1000
      ranges    = ["35.235.240.0/20"]
      allow_ports = [{
        protocol = "tcp"
        ports    = ["22"]
      }]
    }
  ]
  health_check_name = "http-health-check"

}

module "lb" {
  source = "./modules/lb"
  project_id = var.project_id
  instance_group = module.instance_group.instance_group
}

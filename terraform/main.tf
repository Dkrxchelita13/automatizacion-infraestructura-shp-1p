terraform {
  required_version = ">= 1.0.0"
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = ">= 3.7.0"
    }
  }
}

provider "docker" {}

# 1. Definición de la Red Privada (10.10.0.0/24)
resource "docker_network" "private_network" {
  name   = var.network_name
  driver = "bridge"

  ipam_config {
    subnet  = var.network_cidr
    gateway = var.network_gateway
  }
}

# 2. Imágenes de Docker
resource "docker_image" "web_image" {
  name         = "nginx:alpine"
  keep_locally = true
}

resource "docker_image" "app_image" {
  name         = "alpine:latest"
  keep_locally = true
}

resource "docker_image" "db_image" {
  name         = "alpine:latest"
  keep_locally = true
}

# 3. Servidor Web (10.10.0.10)
resource "docker_container" "web" {
  name  = "srv-web"
  image = docker_image.web_image.image_id

  networks_advanced {
    name         = docker_network.private_network.name
    ipv4_address = var.web_ip
  }

  ports {
    internal = 80
    external = var.web_external_port
  }
}

# 4. Servidor de Aplicaciones (10.10.0.20)
resource "docker_container" "app" {
  name  = "srv-app"
  image = docker_image.app_image.image_id

  networks_advanced {
    name         = docker_network.private_network.name
    ipv4_address = var.app_ip
  }

  # Mantiene el contenedor activo para pruebas de red
  command = ["tail", "-f", "/dev/null"]
}

# 5. Servidor de Base de Datos (10.10.0.30)
resource "docker_container" "db" {
  name  = "srv-db"
  image = docker_image.db_image.image_id

  networks_advanced {
    name         = docker_network.private_network.name
    ipv4_address = var.db_ip
  }

  # Mantiene el contenedor activo para pruebas de red
  command = ["tail", "-f", "/dev/null"]
}

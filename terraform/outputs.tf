output "network_id" {
  description = "ID de la red creada"
  value       = docker_network.private_network.id
}

output "web_server_info" {
  description = "Detalles del servidor Web"
  value = {
    name = docker_container.web.name
    ip   = var.web_ip
    port = var.web_external_port
  }
}

output "app_server_info" {
  description = "Detalles del servidor de Aplicación"
  value = {
    name = docker_container.app.name
    ip   = var.app_ip
  }
}

output "db_server_info" {
  description = "Detalles del servidor de Base de Datos"
  value = {
    name = docker_container.db.name
    ip   = var.db_ip
  }
}

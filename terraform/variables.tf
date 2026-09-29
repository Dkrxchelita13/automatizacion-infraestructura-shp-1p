variable "network_name" {
  description = "Nombre de la red bridge de Docker"
  type        = string
  default     = "red-privada-dev"
}

variable "network_cidr" {
  description = "CIDR de la red privada"
  type        = string
  default     = "10.10.0.0/24"
}

variable "network_gateway" {
  description = "Gateway de la red privada"
  type        = string
  default     = "10.10.0.1"
}

variable "web_ip" {
  description = "Dirección IP estática para el contenedor Web"
  type        = string
  default     = "10.10.0.10"
}

variable "app_ip" {
  description = "Dirección IP estática para el contenedor de Aplicación"
  type        = string
  default     = "10.10.0.20"
}

variable "db_ip" {
  description = "Dirección IP estática para el contenedor de Base de Datos"
  type        = string
  default     = "10.10.0.30"
}

variable "web_external_port" {
  description = "Puerto del host expuesto para el servidor Web"
  type        = number
  default     = 80
}

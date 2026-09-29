#!/bin/bash

echo "==========================================="
echo " Iniciando verificación de infraestructura "
echo "==========================================="

echo -e "\n---> 1. Validando estado de Terraform (terraform validate)"
cd terraform || exit
terraform validate
cd ..

echo -e "\n---> 2. Verificando contenedores en ejecución (docker ps)"
docker ps

echo -e "\n---> 3. Verificando red de Docker (docker network ls)"
docker network ls | grep empresa-network

echo -e "\n---> 4. Verificando servicio HTTP del Servidor Web (curl http://localhost)"
curl -I http://localhost

echo -e "\n==========================================="
echo " Verificación completada "
echo "==========================================="

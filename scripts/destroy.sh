#!/bin/bash
export DOCKER_API_VERSION=1.44

echo "============================================="
echo " Iniciando destrucción de la infraestructura "
echo "============================================="
echo " Iniciando destrucción de la infraestructura "
echo "============================================="

cd terraform || exit

echo -e "\n---> Destruyendo recursos (terraform destroy)"
# Se te pedirá confirmación ('yes') antes de eliminar todo.
terraform destroy

echo -e "\n============================================="
echo " Infraestructura destruida correctamente "
echo "============================================="

#!/bin/bash
export DOCKER_API_VERSION=1.44

echo "========================================="
echo " Iniciando despliegue de infraestructura "
echo "========================================="
echo " Iniciando despliegue de infraestructura "
echo "========================================="

# Entrar al directorio de terraform
cd terraform || exit

echo -e "\n---> 1. Inicializando Terraform (terraform init)"
terraform init

echo -e "\n---> 2. Formateando el código (terraform fmt)"
terraform fmt

echo -e "\n---> 3. Validando la configuración (terraform validate)"
terraform validate

echo -e "\n---> 4. Generando plan de ejecución (terraform plan)"
terraform plan

echo -e "\n---> 5. Aplicando la infraestructura (terraform apply)"
# Se ejecutará la aplicación. Deberás escribir 'yes' cuando se te solicite para confirmar.
terraform apply -auto-approve

echo -e "\n========================================="
echo " Despliegue finalizado con éxito "
echo "========================================="

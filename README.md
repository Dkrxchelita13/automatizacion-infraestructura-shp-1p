# Construcción y automatización de una infraestructura de red mediante Terraform

## Introducción
Este proyecto implementa una infraestructura virtual utilizando Infraestructura como Código (IaC) con Terraform. Se integran principios DevOps mediante el versionado del código, la creación de recursos automatizados y la verificación mediante scripts en Bash.

## Descripción del problema
Una pequeña empresa requiere un entorno de desarrollo con servidores web, de aplicaciones y de base de datos conectados en una red privada. La configuración manual actual genera errores humanos, inconsistencias entre servidores, falta de documentación y dificultades para reproducir el entorno.

## Arquitectura
La infraestructura conceptual se compone de una red privada (10.10.0.0/24) que conecta tres servidores:
* **WEB:** 10.10.0.10 (Nginx expuesto en el puerto 80)
* **APP:** 10.10.0.20 (Alpine Linux)
* **DB:** 10.10.0.30 (Alpine Linux)

## Herramientas utilizadas
* **Terraform:** Para la definición y aprovisionamiento de la infraestructura (IaC).
* **Docker:** Como motor de contenedores para simular los servidores sin requerir infraestructura cloud.
* **Bash:** Para la creación de scripts de automatización (`deploy.sh`, `verify.sh`, `destroy.sh`).
* **Git/GitHub:** Para el control de versiones y documentación.

## Descripción de DevOps y Ventajas de la automatización
**DevOps** es una metodología que une el desarrollo de software y las operaciones de TI, priorizando la comunicación, la integración y la automatización. 
Las **ventajas de la automatización** en este contexto incluyen la eliminación de errores humanos en la configuración, el despliegue rápido y predecible, y la capacidad de documentar la infraestructura de forma implícita a través del código fuente.

## Descripción del código Terraform
El proyecto utiliza una estructura modular:
* `main.tf`: Define el provider de Docker, la red privada y los tres contenedores con sus respectivas IPs estáticas.
* `variables.tf`: Declara las variables para evitar valores estáticos en el código principal (CIDR, IPs, nombres).
* `terraform.tfvars`: Asigna los valores reales a las variables declaradas.
* `outputs.tf`: Expone información clave de los recursos creados, como los nombres de los contenedores y las direcciones IP.

## Descripción de los scripts
1. **deploy.sh**: Automatiza las fases de `init`, `fmt`, `validate`, `plan` y `apply` de Terraform de forma desatendida.
2. **verify.sh**: Comprueba el estado de los recursos creados utilizando comandos nativos de Docker (`docker ps`, `docker network ls`) y herramientas de red (`curl`).
3. **destroy.sh**: Ejecuta la eliminación limpia de todos los recursos aprovisionados (`terraform destroy`).

## Procedimiento de implementación y verificación
1. Se inicializa el repositorio y se configuran las variables de entorno.
2. Se ejecuta `./scripts/deploy.sh` para aprovisionar los contenedores y la red en el motor de Docker local.
3. Se ejecuta `./scripts/verify.sh` para validar que el servidor Nginx responda en el puerto 80 y que los contenedores APP y DB estén activos en el segmento 10.10.0.0/24.
## Pregunta de análisis: Reproducibilidad
**¿Qué ventajas presenta reconstruir la infraestructura a partir del código en comparación con realizar nuevamente la configuración manual?**
Reconstruir la infraestructura mediante código favorece la idempotencia y permite obtener una configuración consistente y reproducible a partir del estado declarado. A diferencia de la configuración manual, que es propensa al olvido de pasos, cambios de versiones o errores de tecleo, IaC actúa como una fuente única de verdad, permitiendo levantar entornos de desarrollo o producción completos en segundos y facilitando auditorías de seguridad al tener cada componente explícitamente documentado en archivos `.tf`.

## Resultados
La ejecución de la práctica culminó con la implementación exitosa de una infraestructura de red virtual mediante Terraform. 
Se desplegó una red privada (10.10.0.0/24) y tres servidores: WEB (10.10.0.10), APP (10.10.0.20) y DB (10.10.0.30). 
Las pruebas realizadas mediante `terraform validate`, `docker ps`, `docker network ls` y `curl` confirmaron el correcto funcionamiento de los recursos y del servicio HTTP. Finalmente, se destruyó y reconstruyó la infraestructura, demostrando su reproducibilidad mediante código.
## Conclusiones
La implementación de Infraestructura como Código (IaC) con Terraform resolvió exitosamente los problemas de consistencia del caso de estudio. Se logró estandarizar el despliegue, mitigar configuraciones erróneas y establecer un flujo de trabajo replicable mediante scripts de Bash, demostrando los beneficios tangibles de las prácticas DevOps.

## Evidencias
Se encuentran en el pdf proporcionado:
* Captura de Terraform Init, Validate y Plan.
* Captura de Terraform Apply.
* Captura de los contenedores y red funcionando (Verify).
* Captura de Terraform Destroy y la posterior reconstrucción.

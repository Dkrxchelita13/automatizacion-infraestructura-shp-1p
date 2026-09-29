# Arquitectura de Red

La infraestructura virtual se implementó utilizando contenedores Docker para aislar los servicios en un entorno de desarrollo.

## Topología Lógica

```text
       INFRAESTRUCTURA
              |
      [  Network  ]
      [10.10.0.0/24]
              |
|         |         |
[ WEB ]   [ APP ]   [  DB  ]
10.10.0.10 10.10.0.20 10.10.0.30

## Detalles de los Nodos
* **Network:** Red tipo bridge en Docker nombrada `empresa-network`.
* **WEB:** Servidor Nginx (alpine) exponiendo el puerto 80 hacia el host.
* **APP:** Servidor de aplicaciones basado en Alpine Linux.
* **DB:** Servidor de base de datos basado en Alpine Linux.

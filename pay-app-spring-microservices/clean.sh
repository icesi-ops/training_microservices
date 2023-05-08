#!/bin/bash
echo -e 'Borrando contenedores--------------------------------'
# Eliminar todos los contenedores que empiecen por icesiops/
docker rm -f $(docker ps -a | grep "icesiops/" | awk '{print $1}')

echo -e '\n\nBorrando Imagenes--------------------------------'
# Eliminar todas las imágenes que empiecen por icesiops/
docker rmi -f $(docker images | grep "icesiops/" | awk '{print $3}')

# Mostrar estado actualizado
echo -e '\n\nDOCKER PS----------------------------------------'
docker ps -a | awk '{print $2}'
echo -e '\n\nDOCKER IMAGES------------------------------------'
docker images -a | awk '{print $1}'
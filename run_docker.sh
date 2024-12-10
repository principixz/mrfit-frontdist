#!/bin/bash

# Nombre de la imagen y el contenedor
IMAGE_NAME="mrfit-nginx"
CONTAINER_NAME="mrfit-nginx"

# Construir la imagen Docker
echo "Construyendo la imagen Docker..."
sudo docker build -t $IMAGE_NAME .

# Detener el contenedor existente (si existe)
if [ $(docker ps -q -f name=$CONTAINER_NAME) ]; then
    echo "Deteniendo el contenedor existente..."
    sudo docker stop $CONTAINER_NAME
fi

# Eliminar el contenedor existente (si existe)
if [ $(docker ps -aq -f name=$CONTAINER_NAME) ]; then
    echo "Eliminando el contenedor existente..."
    sudo docker rm $CONTAINER_NAME
fi

# Ejecutar el contenedor con los puertos configurados
echo "Ejecutando el nuevo contenedor..."
sudo docker run -d --name $CONTAINER_NAME -p 8080:80 -p 8443:443 $IMAGE_NAME

echo "Contenedor ejecutado correctamente."
#!/bin/bash
sudo ./scripts/clean.sh
docker-compose -f ./docker/1-dbs-appconfig.yml up --build -d
echo 'Waiting for appconfig up... ... ... ... ...'
sleep 5
docker-compose -f ./docker/2-services.yml up --build -d
sudo ./scripts/config-dnsmasq.sh
echo 'Waiting for consul up... ... ... ... ...'
sleep 5
docker-compose -f ./docker/3-loadbalancer-gateway.yml up --build -d

# Mostrar estado actualizado
echo -e '\n\nDOCKER PS----------------------------------------'
docker ps -a | awk '{print $2}'
echo -e '\n\nDOCKER IMAGES------------------------------------'
docker images -a | awk '{print $1}'
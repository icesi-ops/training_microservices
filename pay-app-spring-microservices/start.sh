#!/bin/bash
sudo ./scripts/clean.sh
sudo ./scripts/config-dnsmasq.sh
docker-compose -f ./docker/resources.yml up --build -d
echo 'Waiting for appconfig up... ... ... ... ...'
sleep 5
docker-compose -f ./docker/services.yml up --build -d
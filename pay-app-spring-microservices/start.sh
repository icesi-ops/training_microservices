#!/bin/bash
sudo ./scripts/clean.sh
docker-compose -f ./docker/resources.yml up --build -d --remove-orphans
echo 'Waiting for appconfig up... ... ... ... ...'
sleep 5
docker-compose -f ./docker/services.yml up --build -d --remove-orphans
sudo ./scripts/config-dnsmasq.sh
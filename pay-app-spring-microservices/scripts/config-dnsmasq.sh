#!/bin/sh

# Update
echo "\n\nUpdating packages------------------------------"
sudo apt-get update

# Instalar dnsmasq
echo "\n\nInstalando Dnsmasq------------------------------"
sudo apt-get install dnsmasq -y

# Eliminar el archivo de configuracion de dnsmasq
echo "\n\nActualizando /etc/dnsmasq.d/10-consul-------------------------------"
sudo rm -f /etc/dnsmasq.d/10-consul

# Crear archivo de configuración para consul
sudo echo "server=/consul/127.0.0.1#8600" > /etc/dnsmasq.d/10-consul

# Mostrar los archivos creados
cat /etc/dnsmasq.d/10-consul

# Detener el servicio por defecto de dns
sudo systemctl stop systemd-resolved.service

# Reiniciar servicio dnsmasq
sudo systemctl restart dnsmasq
echo "\n\nActualizando /etc/resolv.conf------------------------------"

# Agregar nameserver a /etc/resolv.conf
# Eliminar el archivo /etc/resolv.conf
sudo rm -f /etc/resolv.conf
# Crear el archivo /etc/resolv.conf con la nueva información
echo "nameserver 127.0.0.1" | sudo tee -a /etc/resolv.conf > /dev/null
echo "nameserver 8.8.8.8" | sudo tee -a /etc/resolv.conf > /dev/null
echo "options edns0 trust-ad" | sudo tee -a /etc/resolv.conf > /dev/null
echo "search ." | sudo tee -a /etc/resolv.conf > /dev/null

# Reiniciar servicio Network Manager
sudo systemctl restart NetworkManager
cat /etc/resolv.conf

# Reiniciar servicio Network Manager
sudo systemctl restart NetworkManager
cat /etc/resolv.conf

# Comprobar el estado del servicio
sudo systemctl status -q dnsmasq.service
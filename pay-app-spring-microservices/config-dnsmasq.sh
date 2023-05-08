#!/bin/sh

# Instalar dnsmasq
sudo apt-get update
sudo apt-get install dnsmasq -y

echo "Actualizando /etc/dnsmasq.d/10-consul ..."
# Eliminar el archivo de configuracion de dnsmasq
sudo rm -f /etc/dnsmasq.d/10-consul
# Crear archivo de configuración para consul
sudo echo "server=/consul/127.0.0.1#8600" > /etc/dnsmasq.d/10-consul
# Mostrar los archivos creados
cat /etc/dnsmasq.d/10-consul

# Reiniciar servicio dnsmasq
sudo systemctl restart dnsmasq


echo "Actualizando /etc/resolv.conf ..."
# Agregar nameserver a /etc/resolv.conf
# Eliminar el archivo /etc/resolv.conf
sudo rm -f /etc/resolv.conf
# Crear el archivo /etc/resolv.conf con la nueva información
echo "nameserver 8.8.8.8" | sudo tee -a /etc/resolv.conf > /dev/null
echo "nameserver 127.0.0.1" | sudo tee -a /etc/resolv.conf > /dev/null
echo "nameserver 127.0.0.53" | sudo tee -a /etc/resolv.conf > /dev/null
echo "options edns0 trust-ad" | sudo tee -a /etc/resolv.conf > /dev/null
echo "search ." | sudo tee -a /etc/resolv.conf > /dev/null

# Reiniciar servicio Network Manager
sudo systemctl restart NetworkManager
cat /etc/resolv.conf
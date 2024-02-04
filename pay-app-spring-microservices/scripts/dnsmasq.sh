#!/bin/bash

# Update
echo -e "\n\nUpdating packages------------------------------"
brew update

# Install dnsmasq
echo -e "\n\nInstalling Dnsmasq------------------------------"
brew install dnsmasq

# Create config directory
echo -e "\n\nCreating /etc/dnsmasq.d directory------------------------------"
sudo mkdir -pv $(brew --prefix)/etc/

# Create configuration file for consul
echo -e "\n\nUpdating /usr/local/etc/dnsmasq.conf-------------------------------"
echo "server=/consul/127.0.0.1#8600" >> $(brew --prefix)/etc/dnsmasq.conf

# Restart dnsmasq service
echo -e "\n\nRestarting dnsmasq service------------------------------"
sudo brew services restart dnsmasq
sudo killall -HUP mDNSResponder

# Create a dns resolver for consul
sudo mkdir -v /etc/resolver/
cat <<EOF | sudo tee /etc/resolver/consul
nameserver 127.0.0.1#8600
EOF

# Check dnsmasq service status
echo -e "\n\nChecking dnsmasq service status------------------------------"
sudo brew services list | grep dnsmasq
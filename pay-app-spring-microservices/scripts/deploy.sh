#!/bin/bash

# Wait Message Function
wait_message() {
    local message="$1"
    local wait_time="$2"
    echo -n "$message"
    for (( i=0; i<$wait_time; i++ )); do
        sleep 1
        echo -n "."
    done
    echo
}

# Execute Command and Error Handling Function
execute_command() {
    local command="$1"
    local description="$2"
    echo "Ejecutando: $description"
    if ! $command; then
        echo "Error: Fallo al ejecutar $description"
        exit 1
    fi
}

# Clean previous execution
# execute_command "sudo ./scripts/clean.sh" "limpieza previa"

# Deploy Storage Tier
execute_command "docker-compose -f ./tools/storage.yaml up --build -d" "Storage Tier"

# Wait for storage tier to be up
wait_message "Waiting for storage tier" 5

# Deploy Config And Discovery Tier
execute_command "docker-compose -f ./tools/config-and-discovery.yaml up --build -d" "Config and Discovery"

# dnsmasq Configuration
#execute_command "sudo ./tools/dnsmasq.sh" "dnsmasq configuration"

# Wait for config and discovery tier to be up
wait_message "Waiting for config and sevice discovery" 5

# Deploy Broker Tier
execute_command "docker-compose -f ./tools/broker.yaml up --build -d" "Broker"

# Wait for broker tier to be up
wait_message "Waiting for broker tier" 5

# Deploy App Tier
execute_command "docker-compose -f ./tools/compute.yaml up --scale app-invoice=2 --build -d" "App Tier"

# Wait for app tier to be up
wait_message "Waiting for app tier" 5

# Deploy Network Tier
execute_command "docker-compose -f ./tools/network.yaml up --build -d" "Network Tier"

# Wait for network tier to be up
wait_message "Waiting for network tier" 5

# Show Status
echo -e "\n\nProccess Status------------------------------------"
docker ps -a | awk '{print $2}'
echo -e "\n\nImages--------------------------------------------"
docker images -a | awk '{print $1}'
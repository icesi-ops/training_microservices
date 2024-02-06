## Steps
### Create the network
docker network create distribuidos
### Build config Server image
docker build --platform=linux/amd64 -t estebanm1812/app-config .
### Push the server config server image to Docker hub
docker push estebanm1812/app-config 
### Run the container
docker run -d -p 8888:8888 --network distribuidos --name app-config estebanm1812/app-config:latest
### Build config invoice image
docker build --platform=linux/amd64 -t estebanm1812/app-invoice .
### Up/Run Kafka Service
docker run -p 2181:2181 -d -p 9092:9092 --name servicekafka --network distribuidos -e ADVERTISED_HOST=servicekafka -e NUM_PARTITIONS=3 johnnypark/kafka-zookeeper
### Run in-voice Container
docker run -d -p 8006:8006 --network distribuidos --name app-invoice estebanm1812/app-invoice:latest
### Up Posgres Data-base
docker run -p 5434:5432  --name postgres --network distribuidos -e POSTGRES_PASSWORD=postgres -e  POSTGRES_DB=db_invoice -d postgres:12-alpine
### Up Consult Service
docker run -d -p 8500:8500 -p 8600:8600/udp --network distribuidos --name consul consul:1.15 agent -server -bootstrap-expect 1 -ui -data-dir /tmp -client=0.0.0.0


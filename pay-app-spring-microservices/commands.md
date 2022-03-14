docker network create distribuidos
docker run -p 5432:5432 --name postgres --network distribuidos -e POSTGRES_PASSWORD=postgres -e POSTGRES_DB=db_invoice -d icesiops/postgres:0.1.0

docker run -p 3306:3306 --name mysql --network distribuidos -e MYSQL_ROOT_PASSWORD=mysql -e MYSQL_DATABASE=db_operation -d icesiops/mysql:0.1.0

docker run -p 27017:27017 --network distribuidos --name mongodb -d mongo

docker run -p 2181:2181 -d -p 9092:9092 --name servicekafka --network distribuidos -e ADVERTISED_HOST=servicekafka -e NUM_PARTITIONS=3 johnnypark/kafka-zookeeper

docker run -d -p 8888:8888 --network distribuidos --name app-config icesiops/appconfig:0.1.0

docker run -d -p 8006:8006 --network distribuidos --name app-invoice icesiops/appinvoice:0.1.0

docker run -d -p 8010:8010 --network distribuidos --name app-pay icesiops/apppay:0.1.0

docker run -d -p 8082:8082 --network distribuidos --name app-transaction icesiops/apptransaction:0.1.0

psql -h localhost -d db_invoice -U postgres -f data.sql

#### consul

Modify application.properties file according to consul server information.
Add the line  implementation 'org.springframework.cloud:spring-cloud-starter-consul-discovery' into build.gradle depedencies
Install dnsmasq
Create a config file for dnsmasq below the path /etc/dnsmasq.d
Add the next line server=/consul/127.0.0.1#8600
start dnsmasq
modifiy resolv.conf to add ip loopback like dns server
run command: dig app-service.service.consul

docker run -d -p 8500:8500 -p 8600:8600/udp --network distribuidos --name consul consul:latest agent -server -bootstrap-expect 1 -ui -data-dir /tmp -client=0.0.0.0

### Load Balancer
Create dockerfile 
FROM haproxy:2.3
COPY haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg

Create haproxy config
defaults
   timeout connect 5s
   timeout client 1m
   timeout server 1m

frontend stats
   bind *:1936
   mode http
   stats uri /
   stats show-legends
   no log

frontend http_front
   bind *:80
   default_backend http_back

backend http_back
    balance roundrobin
    server-template mywebapp 1-10 _web._tcp.service.consul resolvers consul resolve-opts allow-dup-ip resolve-prefer ipv4 check

resolvers consul
    nameserver consul 127.0.0.1:8600
    accepted_payload_size 8192
    hold valid 5s

docker build -t icesiops/loadbalancer:0.1.0 .


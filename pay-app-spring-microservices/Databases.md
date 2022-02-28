docker network create distribuidos
docker run -p 5432:5432 --name postgres --network distribuidos -e POSTGRES_PASSWORD=postgres -e POSTGRES_DB=db_invoce -d icesiops/postgres:0.1.0

docker run -p 3306:3306 --name mysql --network distribuidos -e MYSQL_ROOT_PASSWORD=MYSQL -e MYSQL_DATABASE=db_operation -d icesiops/mysql:0.1.0

docker run -p 27017:27017 --network distribuidos --name mongodb -d mongo

docker run -p 2181:2181 -d -p 9092:9092 --name servicekafka --network distribuidos -e ADVERTISED_HOST=servicekafka -e NUM_PARTITIONS=3 johnnypark/kafka-zookeeper
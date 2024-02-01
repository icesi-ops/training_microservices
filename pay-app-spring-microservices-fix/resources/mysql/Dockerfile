FROM mysql:8

env MYSQL_ROOT_PASSWORD=MYSQL
env MYSQL_DATABASE=db_operation
COPY ./mysql.sql /docker-entrypoint-initdb.d


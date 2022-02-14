# Endpoints

A continuacion se detallan los scripts para la creación de las bases de datos respectivas para los microservicios


## PostgreSQL

1. Levantar docker de PostgreSQL (Al levantar el docker automaticamente se incluye la base de datos a crear)
```
$ docker run -p 5434:5432  --name postgres --network aforo255-test -e POSTGRES_PASSWORD=postgres -e  POSTGRES_DB=db_invoice -d postgres:12-alpine
```

2. Si se desea agregar nueva base de datos se debe ingresar al docker de Postgres y crear la base:
```
$ docker exec -it postgres bash
$ psql -U postgres
$ CREATE TABLE db_invoice;
```

3. Conectarse a la base de datos desde cualquier cliente SQL (Ejemplo: Dbeaver) y ejecutar el script:
```
CREATE TABLE IF NOT EXISTS invoice
(
    id_invoice integer not null,
    amount numeric,
    state integer,
    primary key (id_invoice)
);
```

## MySQL

1. Levantar docker de MySQL (Al levantar el docker automaticamente se incluye la base de datos a crear)
```
$ docker run -p 3307:3306  --name microservicio-mysql8 --network aforo255-test -e MYSQL_ROOT_PASSWORD=mysql -e MYSQL_DATABASE=db_operation -d mysql:8
```

2. Conectarse a la base de datos desde cualquier cliente SQL (Ejemplo: Dbeaver) y ejecutar el script:
```
CREATE TABLE pay
(
    id_invoice integer not null,
    amount numeric,
    state integer,
    primary key (id_invoice)
);
```

## MongoDB

1. Levantar docker de MongoDB (Al levantar el microservicio y almacenar un registro se crea automaticamente la coleccion en mongo)
```
$ docker run -p 27018:27017 --network aforo255-test --name mongodb -d mongo
```
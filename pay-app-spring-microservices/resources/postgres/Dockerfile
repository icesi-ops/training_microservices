FROM postgres:12-alpine

env POSTGRES_PASSWORD=postgres
env POSTGRES_DB=db_invoice
COPY ./1-postgres.sql /docker-entrypoint-initdb.d
COPY ./2-data.sql /docker-entrypoint-initdb.d

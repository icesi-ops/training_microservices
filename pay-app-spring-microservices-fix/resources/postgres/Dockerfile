FROM postgres:12-alpine

env POSTGRES_PASSWORD=postgres
env POSTGRES_DB=db_invoice
COPY ./postgres.sql /docker-entrypoint-initdb.d


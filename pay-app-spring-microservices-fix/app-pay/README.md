# App Pay

Microservicio encargado de registrar el pago de una factura y dejar un mensaje a la cola de kafka
para actualizar la factura desde el microservicio de app-invoice. También debe dejar un mensaje
para registrar el movimiento en el microservicio de transacciones.

## Dependencias
* JPA (Hibernate)
* Apache Kafka
* Spring Cloud Config
* PostgreSQL
* Lombok

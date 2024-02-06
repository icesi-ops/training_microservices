# Endpoints

A continuacion se detallan los endpoints y se adjuntan los Curl respectivos de cada microservicio para cumplir con las funcionalidad del trabajo


## Microservicios

#### app-config

Microservicio que se encarga de manejar las configuraciones de los microservicios, las configuraciones están en el siguiente directorio:

[Configuraciones](https://github.com/icesi-ops/training_microservices.git)

Endpoints para consultar configuraciones de los microservicios:

* Curl consultar las configuraciones de los microservicios almacenadas en el repositorio
```
curl --location --request GET 'http://localhost:8888/app-pay/dev'

curl --location --request GET 'http://localhost:8888/app-invoice/dev'

curl --location --request GET 'http://localhost:8888/app-transaction/dev'
```

#### app-pay

Microservicio que se encarga de registrar los pagos de una factura

[Dockerfile](https://github.com/icesi-ops/training_microservices.git)

* Curl del servicio para registrar pagos
```
curl --location --request POST 'http://localhost:8010/pay' \
--header 'Content-Type: application/json' \
--data-raw '{
    "idOperation": 1,
    "idInvoice": 1,
    "amount": 900,
    "dateTime": "2021-05-21"
}'
```

#### app-inovice

Microservicio que se encarga de obtener los mensajes de kafka y actualizar el estado de una factura segun el pago registrado

[Dockerfile](https://github.com/icesi-ops/training_microservices.git)

* Curl del servicio para obtener el detalle de todos los invoices
```
curl --location --request GET 'http://localhost:8006/all'
```

#### app-transaction

Microservicio que se encarga de obtener los mensajes de kafka y registrar las transacciones que se realizan con el pago de las facturas

[Dockerfile](https://github.com/icesi-ops/training_microservices.git)

* Curl del servicio para obtener el detalle de todos los invoices
```
curl --location --request GET 'http://localhost:8082/all'
```

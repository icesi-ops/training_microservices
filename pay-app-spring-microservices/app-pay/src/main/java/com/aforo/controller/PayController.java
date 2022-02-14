package com.aforo.controller;

import com.aforo.kafka.producer.PayEventProducer;
import com.aforo.model.Pay;
import com.aforo.service.PayService;
import com.fasterxml.jackson.core.JsonProcessingException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class PayController {

    @Autowired
    private PayService service;

    @Autowired
    PayEventProducer producer;

    private Logger log = LoggerFactory.getLogger(PayController.class);

    @PostMapping("/pay")
    public ResponseEntity<Pay> postDepositEvent(@RequestBody Pay pay) throws JsonProcessingException {
        log.info("Registrando nuevo pago");
        var respose = service.registerPay(pay);
        log.info("Enviando mensaje a Kafka");
        producer.sendPayEvent(respose);
        log.info("Mensaje agregado a la cola correctamente");
        return ResponseEntity.status(HttpStatus.CREATED).body(respose);
    }
}

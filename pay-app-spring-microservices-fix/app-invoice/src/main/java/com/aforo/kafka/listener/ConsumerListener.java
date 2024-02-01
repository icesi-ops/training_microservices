package com.aforo.kafka.listener;

import com.aforo.kafka.consumer.TransactionEvents;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.stereotype.Component;

@Component
public class ConsumerListener {

    @Autowired
    private TransactionEvents events;

    private Logger log = LoggerFactory.getLogger(ConsumerListener.class);

    @KafkaListener(topics = {"transaction-events"})
    public void onMessage(ConsumerRecord<Integer, String> consumerRecord) throws JsonMappingException, JsonProcessingException {
        log.info("*************** MICROSERVICE APP INVOICE *******************");
        log.info("ConsumerRecord : {}", consumerRecord.value());
        events.processTransactionEvent(consumerRecord);
    }
}

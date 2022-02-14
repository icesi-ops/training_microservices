package com.aforo.kafka.consumer;

import com.aforo.dao.TransactionDao;
import com.aforo.model.Transaction;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TransactionEvents {

    @Autowired
    private TransactionDao _dao;

    @Autowired
    private ObjectMapper objectMapper;

    private Logger log = LoggerFactory.getLogger(TransactionEvents.class);

    public void processTransactionEvent(ConsumerRecord<Integer, String> consumerRecord) throws JsonProcessingException {
        Transaction event = objectMapper.readValue(consumerRecord.value(), Transaction.class);
        log.info("Registrando Transaccion Invoice ***" + event.getIdInvoice());
        _dao.save(event);
    }
}

package com.aforo.controller;

import com.aforo.model.Transaction;
import com.aforo.service.TransactionService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class TransactionController {

    @Autowired
    private TransactionService service;

    private Logger log = LoggerFactory.getLogger(TransactionController.class);

    @GetMapping("/all")
    public ResponseEntity<List<Transaction>> findAllInvoices() {
        log.info("Consultando Invoices");
        var respose = service.findAllTransaction();
        return ResponseEntity.status(HttpStatus.CREATED).body(respose);
    }
}

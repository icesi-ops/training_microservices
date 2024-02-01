package com.aforo.controller;

import com.aforo.model.Invoice;
import com.aforo.service.InvoiceService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class InvoiceController {

    @Autowired
    private InvoiceService service;

    private Logger log = LoggerFactory.getLogger(InvoiceController.class);

    @GetMapping("/all")
    public ResponseEntity<List<Invoice>> findAllInvoices() {
        log.info("Consultando Invoices");
        var respose = service.findAllInvoices();
        return ResponseEntity.status(HttpStatus.CREATED).body(respose);
    }
}

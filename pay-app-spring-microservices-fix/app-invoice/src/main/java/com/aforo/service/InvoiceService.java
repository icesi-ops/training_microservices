package com.aforo.service;

import com.aforo.dao.InvoiceDao;
import com.aforo.model.Invoice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class InvoiceService {

    @Autowired
    private InvoiceDao _dao;

    public List<Invoice> findAllInvoices() {
        return _dao.findAllInvoices();
    }
}

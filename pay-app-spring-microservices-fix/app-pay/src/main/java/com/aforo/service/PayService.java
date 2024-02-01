package com.aforo.service;

import com.aforo.dao.PayDao;
import com.aforo.model.Pay;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PayService {

    @Autowired
    private PayDao _dao;

    public Pay registerPay(Pay pay) {
        return _dao.save(pay);
    }
}

package com.aforo.dao;

import com.aforo.model.Transaction;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TransactionDao extends MongoRepository<Transaction, String> {
}

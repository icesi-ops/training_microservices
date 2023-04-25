package com.aforo.dao;

import com.aforo.model.Pay;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PayDao extends CrudRepository<Pay, Integer> {
}

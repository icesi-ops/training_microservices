package com.aforo.model;

import lombok.Data;
import org.bson.codecs.pojo.annotations.BsonId;
import org.springframework.data.mongodb.core.mapping.Document;

import java.io.Serializable;
import java.util.Date;

@Document
@Data
public class Transaction implements Serializable {

    private static final long serialVersionUID = 1L;
    @BsonId
    private String idTransaction;
    private Integer idInvoice;
    private Double amount ;
    private Date dateTime;
}

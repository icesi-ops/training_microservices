package com.aforo.model;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name="pay")
@Data
public class Pay implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_operation")
    private Integer idOperation;
    @Column(name = "id_invoice")
    private Integer idInvoice;
    private Double amount;
    @Temporal(TemporalType.TIMESTAMP)
    private Date dateTime;
}

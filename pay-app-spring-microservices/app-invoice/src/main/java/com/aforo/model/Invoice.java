package com.aforo.model;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name="invoice")
@Data
public class Invoice implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    private Integer idInvoice;
    private Double amount ;
    private Integer state ;
}

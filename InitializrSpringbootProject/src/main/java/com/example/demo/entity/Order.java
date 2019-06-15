/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.demo.entity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

/**
 *
 * @author 84918
 */

@Entity
@Table(name = "orders")
@Getter
@Setter
@AllArgsConstructor
public class Order implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;
    
    @ManyToOne
    @JoinColumn(name = "customerID")
    private User User;
    
    @Column(name = "total")
    private int total;
    
    @Column(name = "status")
    private boolean status;
    
//    @OneToMany
//    @JoinColumn(name = "orderDetailID")
//    @NotNull
//    private OrderDetail orderDetail;  
    
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "orderdate")
    private Date orderdate;

    public Order() {
    }
    
    
}

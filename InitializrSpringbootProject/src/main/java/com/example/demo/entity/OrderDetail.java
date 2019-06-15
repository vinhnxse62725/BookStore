/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.demo.entity;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

/**
 *
 * @author 84918
 */

@Entity
@Table(name = "orderDetail")
@Getter
@Setter
@AllArgsConstructor
public class OrderDetail implements Serializable{
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;
    
    @ManyToOne
    @JoinColumn(name = "orderID")
    private Order order;

    @ManyToOne
    @JoinColumn(name = "bookID")
    private Book book;
    
    @Column(name = "quantity")
    private int quantity;
    
    @Column(name = "totalPrice")
    private double totalPrice;
    
    @Column(name = "discount")
    private int discount;

    public OrderDetail() {
    }
    
    
}

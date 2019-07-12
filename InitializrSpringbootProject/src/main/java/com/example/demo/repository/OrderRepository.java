/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.demo.repository;

import com.example.demo.entity.Order;
import java.util.Date;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;


public interface OrderRepository extends JpaRepository<Order, Integer>{
    
//    @Query("DELETE FROM Orders od WHERE od.id = :orderid")
//    public void deleteOrder(@Param("orderid") int orderid);
    
//    @Query("SELECT o FROM orders o WHERE o.orderdate >= :fromDate AND o.orderdate <= :toDate ")
//    List<Order> getOrderOrderBy(@Param("fromDate") String fromDate,@Param("toDate") String toDate);
//                            
    @Query("SELECT od FROM Order od WHERE od.orderdate >= ?1 AND od.orderdate <= ?2 ")
    List<Order> getOrderOrderBy(@Param("fromDate") Date fromDate, @Param("toDate") Date toDate);
}

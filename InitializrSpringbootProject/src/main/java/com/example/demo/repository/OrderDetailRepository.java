/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.demo.repository;

import com.example.demo.entity.OrderDetail;
import java.awt.print.Pageable;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;


@Repository
public interface OrderDetailRepository extends JpaRepository<OrderDetail, Integer>{
    
     // Paging
    @Query(value = "SELECT od FROM OrderDetail od")
    public List<OrderDetail> paging(Pageable pageable);
    
    //Paging and searching with order id
    //@Query("SELECT od from OrderDetail od where LOWER(od.orderDetailIdentity.order.id) LIKE CONCAT('%',LOWER(:orderid),'%')")
    //old: public List<OrderDetail> findAndPaging(@Param("orderid") String orderid, Pageable pageable);
    //public List<OrderDetail> findAndPaging(String orderid, Pageable pageable);
    
    // Searching
//    @Query("SELECT od FROM OrderDetail od WHERE LOWER(od.orderid) = LOWER(:orderid)")
//    public List<OrderDetail> search(@Param("orderid") int orderid);
    
}

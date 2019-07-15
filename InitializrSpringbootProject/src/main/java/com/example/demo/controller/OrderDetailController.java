/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.demo.controller;

import com.example.demo.repository.OrderDetailRepository;
import com.example.demo.repository.OrderRepository;
import com.example.demo.repository.BookRepository;
import com.example.demo.entity.Order;
import com.example.demo.entity.OrderDetail;
//import com.example.demo.entity.OrderDetailIdentity;
import com.example.demo.entity.Book;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author edu-boot
 */
@RestController
@RequestMapping("/api/orderdetail")
public class OrderDetailController {

    @Autowired
    private OrderDetailRepository orderDetailRepository;

    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private BookRepository bookRepository;

    // GET list items
    @GetMapping("")
    @CrossOrigin(origins = "http://localhost:8080")
    Iterable<OrderDetail> readAll() {
        return orderDetailRepository.findAll();
    }

    // GET single item
    @GetMapping("/{orderid}")
    @CrossOrigin(origins = "http://localhost:8080")
    List<OrderDetail> read(@PathVariable int orderid) {

//        Optional<Order> optionalOrder = orderRepository.findById(orderid);
//        Order order = optionalOrder.get();
//        
//        Optional<Book> optionalBook = bookRepository.findById(productid);
//        Book product = optionalBook.get();
        List<OrderDetail> list = orderDetailRepository.findAll();
        List<OrderDetail> result = new ArrayList<OrderDetail>();
        for (OrderDetail orderDetail : list) {
            if(orderDetail.getOrder().getId() == orderid) {
                result.add(orderDetail);
            }
        }
        return  result;
    }

    // POST create item
    @PostMapping("")
    @CrossOrigin(origins = "http://localhost:8080")
    OrderDetail create(@RequestBody OrderDetail newOrderDetail) {
        return orderDetailRepository.save(newOrderDetail);
    }

    // PUT edit item
//    @PutMapping("/{orderid}/{productid}")
//    @CrossOrigin(origins = "http://localhost:8080")
//    OrderDetail update(@RequestBody OrderDetail edittedOrderDetail, @PathVariable int orderid, @PathVariable int productid) {
//        
//        Optional<Order> optionalOrder = orderRepository.findById(orderid);
//        Order order = optionalOrder.get();
//        
//        Optional<Book> optionalBook = bookRepository.findById(productid);
//        Book product = optionalBook.get();
//        
////        OrderDetailIdentity identity = new OrderDetailIdentity(order,product);
//        
//        return orderDetailRepository.findById(identity)
//            .map(orderDetail -> {
//                orderDetail.setQuatity(edittedOrderDetail.getQuatity());
//                orderDetail.setDiscount(edittedOrderDetail.getDiscount());
//                orderDetail.setValid(edittedOrderDetail.isValid());
//                orderDetail.setModify(Calendar.getInstance().getTime());
//                return orderDetailRepository.save(orderDetail);
//            })
//            .orElseGet(() -> {
//                edittedOrderDetail.setOrderDetailIdentity(identity);
//                return orderDetailRepository.save(edittedOrderDetail);
//            });
//    }
    // DELETE remove item
    @DeleteMapping("/{id}")
    @CrossOrigin(origins = "http://localhost:8080")
    void delete(@PathVariable int id) {

//        Optional<Order> optionalOrder = orderRepository.findById(id);
//        Order order = optionalOrder.get();
//        Optional<Book> optionalBook = bookRepository.findById(productid);
//        Book product = optionalBook.get();
//        OrderDetailIdentity identity = new OrderDetailIdentity(order,product);
        orderDetailRepository.deleteById(id);
    }
}

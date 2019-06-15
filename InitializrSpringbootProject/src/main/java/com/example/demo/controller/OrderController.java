/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.demo.controller;

import com.example.demo.repository.OrderRepository;
import com.example.demo.entity.Order;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
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

@RestController
@RequestMapping(value = "/api/order")
public class OrderController {

    @Autowired
    private OrderRepository orderRepository;

    // GET list orders
    @GetMapping("")
    @CrossOrigin(origins = "http://localhost:4200")
    Iterable<Order> readAll() {
        return orderRepository.findAll();
    }

    // GET list orders by userID
    @GetMapping("/userid/{id}")
    @CrossOrigin(origins = "http://localhost:4200")
    Iterable<Order> getOrderByUserID(@PathVariable int id) {
        
        List<Order> list = orderRepository.findAll();
        List<Order> result = new ArrayList<>();
        for (Order order : list) {
            if(order.getUser().getId() == id) {
                result.add(order);
            }
        }
        return result;
    }
    
    //GET order by id
    @GetMapping("/{id}")
    @CrossOrigin(origins = "http://localhost:4200")
    Order read(@PathVariable int id) {
        return orderRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Not found"));
    }

    // POST create order
    @PostMapping("")
    @CrossOrigin(origins = "http://localhost:4200")
    Order create(@RequestBody Order newOrder) {
        return orderRepository.save(newOrder);
    }

    // PUT edit item
    @PutMapping("/{id}")
    @CrossOrigin(origins = "http://localhost:4200")
    Order update(@RequestBody Order editedOrder, @PathVariable int id) {
        return orderRepository.findById(id)
                .map(order -> {
                    order.setUser(editedOrder.getUser());
                    order.setTotal(editedOrder.getTotal());
                    order.setOrderdate(editedOrder.getOrderdate());
                    order.setStatus(editedOrder.isStatus());
                    return orderRepository.save(order);
                })
                .orElseGet(() -> {
                    return orderRepository.save(editedOrder);
                });
    }

    // DELETE remove item
    @DeleteMapping("/{id}")
    @CrossOrigin(origins = "http://localhost:4200")
    void delete(@PathVariable int id) {
        orderRepository.deleteById(id);
    }

}

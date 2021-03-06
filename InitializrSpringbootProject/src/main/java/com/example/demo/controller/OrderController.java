/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.demo.controller;

import com.example.demo.entity.Book;
import com.example.demo.entity.BookTop;
import com.example.demo.repository.OrderRepository;
import com.example.demo.entity.Order;
import com.example.demo.entity.OrderDetail;
import com.example.demo.repository.BookRepository;
import com.example.demo.repository.OrderDetailRepository;
import com.fasterxml.jackson.databind.util.JSONPObject;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.datetime.joda.DateTimeParser;
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
    @Autowired
    private OrderDetailRepository orderDetailRepository;
    @Autowired
    private BookRepository bookRepository;

    // GET list orders
    @GetMapping("")
    @CrossOrigin(origins = "http://localhost:8080")
    Iterable<Order> readAll() {
        return orderRepository.findAll();
    }

    // GET list orders by userID
    @GetMapping("/userid/{id}")
    @CrossOrigin(origins = "http://localhost:8080")
    Iterable<Order> getOrderByUserID(@PathVariable int id) {

        List<Order> list = orderRepository.findAll();
        List<Order> result = new ArrayList<>();
        for (Order order : list) {
            if (order.getUser().getId() == id) {
                result.add(order);
            }
        }
        return result;
    }

    //GET order by id
    @GetMapping("/{id}")
    @CrossOrigin(origins = "http://localhost:8080")
    Order read(@PathVariable int id) {
        return orderRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Not found"));
    }

    // POST create order
    @PostMapping("")
    @CrossOrigin(origins = "http://localhost:8080")
    Order create(@RequestBody Order newOrder) {
//            ,@RequestBody Map list) {
//        orderRepository.save(newOrder);
//        List<Order> listOrder = orderRepository.findAll();
//        Order dto = listOrder.get(listOrder.size() - 1);
//        System.out.println( list.isEmpty());
//        for (OrderDetail orderDetail : list) {
//            orderDetail.setOrder(dto);
//            orderDetailRepository.save(orderDetail);
//        }
        return orderRepository.save(newOrder);
    }

    // PUT edit item
    @PutMapping("/{id}")
    @CrossOrigin(origins = "http://localhost:8080")
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

        // PUT edit item
    @PutMapping("/status/{id}")
    @CrossOrigin(origins = "http://localhost:8080")
    Order updateStatus(@RequestBody Order editedOrder, @PathVariable int id) {
        return orderRepository.findById(id)
                .map(order -> {
                    order.setStatus(editedOrder.isStatus());
                    return orderRepository.save(order);
                })
                .orElseGet(() -> {
                    return orderRepository.save(editedOrder);
                });
    }

    
    // DELETE remove item
    @DeleteMapping("/{id}")
    @CrossOrigin(origins = "http://localhost:8080")
    void delete(@PathVariable int id) {
        Order order = orderRepository.findById(id).get();
        order.setStatus(false);
        orderRepository.save(order);
    }

    // get top 3 book in month
    @GetMapping("/orderbyMonth")
    @CrossOrigin(origins = "http://localhost:8080")
    List<BookTop> getOrderbyMonth() {
        LocalDateTime time = LocalDateTime.now();
        Date fromDate = new Date();
        Date toDate = new Date();
        try {
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            fromDate = format.parse(time.getYear() + "-" + time.getMonthValue() + "-" + 1);
            toDate = format.parse(time.getYear() + "-" + time.getMonthValue() + "-" + time.getDayOfMonth());
        } catch (ParseException e) {
            e.printStackTrace();
        }
//        JSONObject obj = new JSONObject();
//        List<Book> books = getBookByDate(fromDate, toDate);
//        for (Book book : books) {
//            obj.put("id", book.getId());
//            
//        }
        return getBookByDate(fromDate, toDate);
    }

// get top 3 book in day
    @GetMapping("/orderbyDay")
    @CrossOrigin(origins = "http://localhost:8080")
    List<BookTop> getOrderbyDay() {
        LocalDateTime time = LocalDateTime.now();
        Date fromDate = new Date();
        Date toDate = new Date();
        try {
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            fromDate = format.parse(time.getYear() + "-" + time.getMonthValue() + "-" + time.getDayOfMonth());
            toDate = format.parse(time.getYear() + "-" + time.getMonthValue() + "-" + time.getDayOfMonth());
        } catch (ParseException e) {
            e.printStackTrace();
        }
        toDate.setHours(24);
        fromDate.setHours(0);
        System.out.println(fromDate + "           " + toDate);
        return getBookByDate(fromDate, toDate);
    }

    private List<BookTop> getBookByDate(Date fromDate, Date toDate) {

        List<Order> orders = orderRepository.getOrderOrderBy(fromDate, toDate);
        List<OrderDetail> details = new ArrayList<OrderDetail>();
        for (Order order : orders) {
            System.out.println(order.getId() + "   orderID");
            details.addAll(orderDetailRepository.search(order.getId()));
        }
        int[] count = new int[10000];

        for (OrderDetail detail : details) {
            System.out.println("orderDetail " + detail.getId());
            count[detail.getBook().getId()] += detail.getQuantity();
        }
        List<BookTop> books = new ArrayList<>();
        for (int i = 0; i < 3; i++) {
            int max = 0;
            int index = 0;
            for (int j = 0; j < count.length; j++) {
                if (count[j] > max) {
                    max = count[j];
                    index = j;
                }
            }
            if (max != 0) {
                System.out.println(index + "   " + max);
                BookTop book = new BookTop(bookRepository.findById(index).get(), count[index]);
                books.add(book);
                count[index] = 0;
            } else {
                break;
            }
        }
        return books;
    }
}

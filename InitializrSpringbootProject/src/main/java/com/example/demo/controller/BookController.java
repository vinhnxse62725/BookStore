/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.demo.controller;

import com.example.demo.entity.Book;
import com.example.demo.repository.BookRepository;
import java.sql.Date;
import java.time.LocalDate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author 84918
 */

@RestController
@RequestMapping(value = "/api/book")
public class BookController {
    
    @Autowired BookRepository bookRepository;
    
    @GetMapping("")
    @CrossOrigin(origins = "http://localhost:4200")
    Iterable<Book> readAll() {
        return bookRepository.findAll();
    }

    //GET product by id
    @GetMapping("/{id}")
    @CrossOrigin(origins = "http://localhost:4200")
    Book read(@PathVariable int id) {
        return bookRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Not found"));
    }

    // POST create product
    @PostMapping("")
    @CrossOrigin(origins = "http://localhost:4200")
    Book create(@RequestBody Book newBook) {
        return bookRepository.save(newBook);
    }

    // PUT edit item
    @PutMapping("/{id}")
    @CrossOrigin(origins = "http://localhost:4200")
    Book update(@RequestBody Book editedBook, @PathVariable int id) {
        return bookRepository.findById(id)
                .map(book -> {
                    book.setBookName(editedBook.getBookName());
                    book.setDescription(editedBook.getDescription());
                    book.setPrice(editedBook.getPrice());
                    book.setQuantity(editedBook.getQuantity());
                    book.setStatus(editedBook.isStatus());
                    book.setDiscount(editedBook.getDiscount());
                    book.setCategory(editedBook.getCategory());
                    return bookRepository.save(book);
                })
                .orElseGet(() -> {
                    return bookRepository.save(editedBook);
                });
    }

    // DELETE remove item
    @DeleteMapping("/{id}")
    @CrossOrigin(origins = "http://localhost:4200")
    void delete(@PathVariable int id) {
        bookRepository.deleteById(id);
    }

    @GetMapping(value = "/searching")
    @CrossOrigin(origins = "http://localhost:4200")
    Iterable<Book> findAllBookAdmin(@RequestParam(value = "search", required = false) String search) {
        return bookRepository.findName(search);
    }
    
}

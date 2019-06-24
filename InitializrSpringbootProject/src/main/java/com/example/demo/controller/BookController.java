/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.demo.controller;

import com.example.demo.entity.Book;
import com.example.demo.repository.BookRepository;
import com.example.demo.repository.CategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
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

    @Autowired
    BookRepository bookRepository;
    @Autowired
    CategoryRepository categoryRepository;

    @GetMapping("")
    @CrossOrigin(origins = "http://localhost:4200")
    Iterable<Book> readAll() {
        return bookRepository.findAll();
    }

    @GetMapping("/searchByCategoryId")
    @CrossOrigin(origins = "http://localhost:4200")
    Iterable<Book> getBookByCateId(@RequestParam(value = "searchValue", required = false) String searchValue,
            @RequestParam(value = "cateId", required = false) Integer cateId) {
        if (cateId == null || cateId == 1) {
            return bookRepository.findByName(searchValue);
        } else {
            return bookRepository.findByCategoryId(searchValue, cateId);
        }
    }

    //GET product by id
    @GetMapping("/{id}")
    @CrossOrigin(origins = "http://localhost:4200")
    Book read(@PathVariable int id) {
        return bookRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Not found"));
    }

    //GET product by id /{page}/{searchValue}/{cateId}
    @GetMapping("/getPaging")
    @CrossOrigin(origins = "http://localhost:4200")
    Page<Book> getPaging(@RequestParam(value = "page", required = false) Integer page,
            @RequestParam(value = "searchValue", required = false) String searchValue,
            @RequestParam(value = "cateId", required = false) Integer cateId) {

        Pageable pageable = PageRequest.of(page, 2);
        System.out.println(searchValue + "         " + cateId);

        if (cateId == null) {
            return bookRepository.findAll(pageable);
        } else {
            return bookRepository.findBooks(pageable, searchValue, cateId);
        }

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

//    @GetMapping(value = "/searching")
//    @CrossOrigin(origins = "http://localhost:4200")
//    Iterable<Book> findAllBookAdmin(@RequestParam(value = "search", required = false) String search) {
//        return bookRepository.findName(search);
//    }
}

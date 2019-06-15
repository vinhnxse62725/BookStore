/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.demo.repository;

import com.example.demo.entity.Book;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;


public interface BookRepository extends JpaRepository<Book, Integer>{
    @Query("SELECT p FROM Book p WHERE LOWER(p.bookName) LIKE  CONCAT ('%',LOWER(:name),'%')")
    public Iterable<Book> findName(@Param("name") String name);
}

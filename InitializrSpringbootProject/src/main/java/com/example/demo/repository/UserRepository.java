/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.example.demo.entity.User;
import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

/**
 *
 * @author edu-boot
 */
public interface UserRepository extends JpaRepository<User, Integer> , JpaSpecificationExecutor<User>{
    Optional<User> findByCustomerID(String customerID);

//    static Specification<User> filterByCustomerID(String customerID){
//        return (root, cq, cb) -> {
//            return cb.like(root.get("customerID"),"%"+customerID+"%" );
//        };
//    }
//    
//    @Query("SELECT p FROM User p WHERE LOWER(p.customerID) LIKE  CONCAT ('%',LOWER(:customerID),'%')")
//    public List<User> findCustomerID(@Param("customerID") String customerID);

}

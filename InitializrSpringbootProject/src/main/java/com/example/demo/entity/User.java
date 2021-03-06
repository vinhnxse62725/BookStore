
package com.example.demo.entity;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

/**
 *
 * @author edu-boot
 */
@Entity
@Table(name = "users")
@Getter
@Setter
@AllArgsConstructor
public class User implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;
    
    @Column(name = "customerID")
    private String customerID;
    
    @Column(name = "password")
    private String password;
    
    @Column(name = "email")
    private String email;
    
    @Column(name = "isAdmin")
    private boolean isAdmin;
    
    @Column(name = "fullname")
    private String fullname;
    
    @Column(name = "gender")
    private String gender;
    
    @Column(name = "age")
    private int age;
    
    @Column(name = "phone")
    private String phone;
    
    @Column(name = "address")
    private String address;
    
    @Column(name = "isActive")
    private boolean isActive;
    
    public User() {
    }
    
}

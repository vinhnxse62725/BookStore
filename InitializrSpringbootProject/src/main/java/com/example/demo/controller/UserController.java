/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.demo.controller;

import com.example.demo.entity.User;
import com.example.demo.repository.UserRepository;
import com.example.demo.service.UserService;
import java.security.Principal;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author edu-boot
 */
@RestController
@RequestMapping("/auth")
public class UserController {

    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }
    @Autowired
    private UserRepository userRepository;

    //Get current user
    @RequestMapping(value = "user/me", method = RequestMethod.GET)
    @CrossOrigin(origins = "http://localhost:8080")
    public ResponseEntity<User> getMe(Principal principal) {
        if (principal != null) {
            String name = principal.getName();
            User user = userService.getUserByUserName(name);
            if (user == null) {
                return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
            }
            return ResponseEntity.status(HttpStatus.OK).body(user);

        }
        return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
    }

    @GetMapping("/user/{id}")
    @CrossOrigin(origins = "http://localhost:8080")
    User read(@PathVariable int id) {
        return userService.findUserById(id).get();
    }

    @GetMapping("/user/getAll")
    @CrossOrigin(origins = "http://localhost:8080")
    public Iterable<User> getAll() {
        return userService.findAllUser();
    }

    @PutMapping("/user/{id}")
    @CrossOrigin(origins = "http://localhost:8080")
    User update(@RequestBody User editedUser, @PathVariable int id) {
        return userService.update(id, editedUser);
    }

    @PutMapping("/user/active/{id}")
    @CrossOrigin(origins = "http://localhost:8080")
    User updateStatus(@RequestBody User editedUser, @PathVariable int id) {
        return userRepository.findById(id)
                .map(user -> {
                    user.setActive(editedUser.isActive());
                    return userRepository.save(user);
                })
                .orElseGet(() -> {
                    return userRepository.save(editedUser);
                });
    }

    @PostMapping("/sign-up")
    @CrossOrigin(origins = "http://localhost:8080")
    public ResponseEntity<User> signUp(@RequestBody User user) {
        User result = userService.createUser(user);
        return ResponseEntity.ok().body(result);
    }

    @PostMapping("/create")
    @CrossOrigin(origins = "http://localhost:8080")
    public ResponseEntity<User> createNewUser(@RequestBody User user) {
        User result = userService.createUserManage(user);
        return ResponseEntity.ok().body(result);
    }

//    @GetMapping(value = "/admin/user/getAll")
//    @CrossOrigin(origins = "http://localhost:8080")
//    Iterable<User> findAllCategoryAdmin(@RequestParam(value = "search", required = false) String search) {
//        Iterable<User> result = userService.getUserByName(search);
//        return result;
//    }
    @DeleteMapping("/user/{id}")
    @CrossOrigin(origins = "http://localhost:8080")
    void delete(@PathVariable int id) {
        try {
            User user = userService.findUserById(id).get();
            user.setActive(false);
            userService.update(id, user);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

    }

    @GetMapping("/user/checkPass")
    @CrossOrigin(origins = "http://localhost:8080")
    public boolean checkPass(@RequestParam(value = "id", required = false) int id,
            @RequestParam(value = "password", required = false) String password) {
        return userService.checkPassword(id, password);
    }
    @PutMapping("/user/changePassword") 
    @CrossOrigin(origins = "http://localhost:8080") 
    void changePassword(@RequestParam(value = "id", required = false) int id,
            @RequestParam(value = "password", required = false) String password
            ) { 
        userService.changePassword(id, password); 
    } 
 
}

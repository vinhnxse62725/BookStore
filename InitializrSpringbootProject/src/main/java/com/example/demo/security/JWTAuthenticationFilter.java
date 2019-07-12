/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.demo.security;

import com.auth0.jwt.JWT;
import com.example.demo.entity.User;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

/**
 *
 * @author edu-boot
 */
import static com.auth0.jwt.algorithms.Algorithm.HMAC512;
import com.example.demo.constants.SecurityConstant;
import static com.example.demo.constants.SecurityConstant.EXPIRATION_TIME;
import static com.example.demo.constants.SecurityConstant.HEADER_STRING;
import static com.example.demo.constants.SecurityConstant.TOKEN_PREFIX;
import static com.example.demo.constants.SecurityConstant.SECRET;
import com.example.demo.controller.UserController;
import com.example.demo.repository.UserRepository;
import com.example.demo.service.UserService;
import java.util.List;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

public class JWTAuthenticationFilter extends UsernamePasswordAuthenticationFilter {

    private UserService userService;
    private AuthenticationManager authenticationManager;
    private UserController controller;

    public JWTAuthenticationFilter(AuthenticationManager authenticationManager) {
        this.authenticationManager = authenticationManager;
    }

    @Override
    public Authentication attemptAuthentication(HttpServletRequest req,
            HttpServletResponse res) throws AuthenticationException {
        try {
            User creds = new ObjectMapper()
                    .readValue(req.getInputStream(), User.class);
            List<SimpleGrantedAuthority> authorities = new ArrayList<>();
            authorities.add(new SimpleGrantedAuthority(("" + creds.isAdmin())));

            return authenticationManager.authenticate(
                    new UsernamePasswordAuthenticationToken(
                            creds.getCustomerID(),
                            creds.getPassword(),
                            new ArrayList<>())
            );
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void successfulAuthentication(HttpServletRequest req,
            HttpServletResponse res,
            FilterChain chain,
            Authentication auth) throws IOException, ServletException {
        
//        System.out.println(((UserDetails) auth.getPrincipal()).getUsername());
//        User dto = null;
//        Iterable<User> users = controller.getAll();
        
//        for (User user : users) {
//            System.out.println(user.getCustomerID());
//            if(user.getCustomerID().equals(((UserDetails) auth.getPrincipal()).getUsername())) {
//                dto = user;
//                break;
//            };
//        }
//        System.out.println(dto.isActive()); 
        
        String token = JWT.create()
                .withSubject(((UserDetails) auth.getPrincipal()).getUsername())
                .withExpiresAt(new Date(System.currentTimeMillis() + EXPIRATION_TIME))
                .sign(HMAC512(SECRET.getBytes()));
        res.addHeader(HEADER_STRING, TOKEN_PREFIX + token);
        res.addHeader("Access-Control-Expose-Headers", "Access-Token, Uid");
        res.getWriter().write(TOKEN_PREFIX + token);
    }

}

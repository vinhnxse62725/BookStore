/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.demo.config;

import com.example.demo.repository.UserRepository;
import com.example.demo.security.JWTAuthenticationFilter;
import com.example.demo.security.JWTAuthorizationFilter;
import com.example.demo.service.UserDetailsServiceImpl;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.cors.CorsConfiguration;

/**
 *
 * @author edu-boot
 */
@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class WebSecurity extends WebSecurityConfigurerAdapter {

    private final UserDetailsServiceImpl userDetailsService;
    private final UserRepository userRepository;

    public WebSecurity(UserDetailsServiceImpl userDetailsService, UserRepository userRepository) {
        this.userDetailsService = userDetailsService;
        this.userRepository = userRepository;
    }

    @Override
    @Bean
    public AuthenticationManager authenticationManagerBean() throws Exception {
        return super.authenticationManagerBean();
    }

    @Override
    public void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService).passwordEncoder(new BCryptPasswordEncoder());

    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        JWTAuthenticationFilter authenticationFilter = new JWTAuthenticationFilter(authenticationManager());
        authenticationFilter.setFilterProcessesUrl("/auth/login");

        http.cors().configurationSource(request -> new CorsConfiguration().applyPermitDefaultValues());
        http.cors().and().csrf().disable().authorizeRequests()
                .antMatchers(HttpMethod.OPTIONS, "/**").permitAll()
                .antMatchers(HttpMethod.GET, "/api/book/**").permitAll()
                .antMatchers(HttpMethod.POST, "/api/book/**").hasRole("ADMIN")
                .antMatchers(HttpMethod.PUT, "/api/book/**").hasRole("ADMIN")
                .antMatchers(HttpMethod.DELETE, "/api/book/**").hasRole("ADMIN")
                .antMatchers(HttpMethod.GET, "/api/category/**").permitAll()
                .antMatchers(HttpMethod.GET, "/api/order/**").permitAll()
                .antMatchers(HttpMethod.POST, "/api/order/**").permitAll()
                .antMatchers(HttpMethod.PUT, "/api/order/**").hasRole("ADMIN")
                .antMatchers(HttpMethod.DELETE, "/api/order/**").hasRole("ADMIN")
                .antMatchers(HttpMethod.GET, "/api/orderdetail/**").permitAll()
                .antMatchers(HttpMethod.POST, "/api/orderdetail/**").permitAll()
                .antMatchers(HttpMethod.PUT, "/api/orderdetail/**").hasRole("ADMIN")
                .antMatchers(HttpMethod.DELETE, "/api/orderdetail/**").hasRole("ADMIN")
                .antMatchers(HttpMethod.GET, "/auth/**").permitAll()
                .antMatchers(HttpMethod.POST, "/auth/**").permitAll()
                .antMatchers(HttpMethod.PUT, "/auth/**").permitAll()
                .antMatchers(HttpMethod.DELETE, "/auth/**").hasRole("ADMIN")
                //                .antMatchers(HttpMethod.PUT, "/**").access("hasRole('ADMIN')")
                //                .antMatchers(HttpMethod.DELETE, "/**").access("hasRole('ADMIN')")
                //                .antMatchers(HttpMethod.PUT, "/**").hasRole("ADMIN")
                //                .antMatchers(HttpMethod.DELETE, "/**").hasRole("ADMIN")
                //                .antMatchers(HttpMethod.PUT, "/api/**").hasRole("ADMIN")
                //                .antMatchers(HttpMethod.DELETE, "/api/**").hasRole("ADMIN")
                //                .antMatchers(HttpMethod.POST, "/api/**").hasRole("ADMIN")
                .antMatchers(HttpMethod.POST, "/auth/user/**", "/api/user/product/cart").permitAll()
                .antMatchers("/", "/static/**", "/**.{js,json,css}").permitAll()
                .anyRequest().authenticated()
                //                .anyRequest().permitAll()
                .and()
                .addFilter(authenticationFilter)
                .addFilter(new JWTAuthorizationFilter(authenticationManager(), userRepository))
                .sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS);

    }

    @Bean
    public BCryptPasswordEncoder encoder() {
        return new BCryptPasswordEncoder();
    }

}

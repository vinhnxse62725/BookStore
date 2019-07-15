package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

@SpringBootApplication(exclude = {SecurityAutoConfiguration.class})
public class ShoppingOnlineApplication {

    public static void main(String[] args) {
        SpringApplication.run(ShoppingOnlineApplication.class, args);

    }
    private final long MAX_AGE_SECS = 3600;

    @Bean
    public WebMvcConfigurer corsConfigurer() {
        return new WebMvcConfigurerAdapter() {
            @Override
            public void addCorsMappings(CorsRegistry registry) {
                registry.addMapping("/**")
                        .allowedOrigins("*")
                        .exposedHeaders("x-requested-with, authorization")
                        .allowedOrigins("*")
                        .allowedMethods("POST, GET, OPTIONS, DELETE, PUT")
                        .allowedHeaders("x-requested-with, authorization,Content-Type")
                        .maxAge(MAX_AGE_SECS)
                        .allowCredentials(true);;

            }
        };
    }
}

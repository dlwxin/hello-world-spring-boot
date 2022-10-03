package com.example.demo.controller;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.UUID;

/**
 * Created on 2022/1/30.
 *
 * @author dlwxin
 */
@CrossOrigin
@RestController
@RequestMapping("/api")
public class HelloWorldController {

    @GetMapping("/")
    public String helloWorld(){
        return "Hello World";
    }

    @GetMapping("/hash")
    public String hash(){
        return UUID.randomUUID().toString();
    }
    
}

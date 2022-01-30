package com.example.demo.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created on 2022/1/30.
 *
 * @author dlwxin
 */
@RestController
public class HelloWorldController {

    @GetMapping("/")
    public String helloWorld(){
        return "Hello World";
    }
}

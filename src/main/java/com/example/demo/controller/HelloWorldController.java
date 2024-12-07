package com.example.demo.controller;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.io.File;
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

    @GetMapping("/path")
    public boolean path(@RequestParam String path){
        File directory = new File(path);
        if (!directory.exists() && !directory.mkdirs()) {
           return false;
        }
        return true;
    }
}

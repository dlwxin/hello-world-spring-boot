package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@RestController
public class ConfigController {

    @Value("${demo.app.cert.path}")
    private String appCertPath;

    @Value("${demo.app.secret.key}")
    private String appSecretKey;

    @Value("${demo.current.env}")
    private String currentEnv;

    @GetMapping("/config")
    public Map<String,String> config(){
        return Map.of("appCertPath", appCertPath, "appSecretKey", appSecretKey, "currentEnv", currentEnv);
    }
}

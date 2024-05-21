package com.example.demo.controller;

import com.example.demo.service.ConfigService;
import jakarta.annotation.Resource;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;

@RestController
public class ConfigController {

    @Resource
    ConfigService configService;

    @Value("${demo.app.cert.path}")
    private String appCertPath;

    @Value("${demo.app.secret.key}")
    private String appSecretKey;

    @Value("${demo.current.env}")
    private String currentEnv;

    @Value("${demo.app.platform}")
    private String platform;

    @Value("${demo.app.http.method}")
    private String httpMethod;

    @Value("${demo.app.target.number}")
    private String targetNumber;

    @GetMapping("/config")
    public Map<String, String> config() {
        String fileContent = configService.loadFile(appCertPath);
        LocalDateTime eventtime = LocalDateTime.now();
        return Map.of("appCertPath", appCertPath, "appSecretKey", appSecretKey, "currentEnv", currentEnv,
                "fileContent", fileContent, "eventtime", eventtime.toString(), "platform", platform,
                "httpMethod", httpMethod, "targetNumber", targetNumber);
    }
}

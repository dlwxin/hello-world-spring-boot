package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

@Service
public class ConfigService {

    @jakarta.annotation.Resource
    private ResourceLoader resourceLoader;

    public String loadFile(String path) {
        String content = "Not Found";
        try {
            Resource resource = resourceLoader.getResource(path);
            File file = Paths.get(resource.getURI()).toFile();
            content = new String(Files.readAllBytes(file.toPath()));
        } catch (IOException e) {
            content = "ERROR: " + e.getMessage();
        }
        return content;
    }
}

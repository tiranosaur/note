package com.example.springdemo.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Map;

@RestController
@RequestMapping("/wopi")
public class CollaboraController {
    @GetMapping(value = {""})
    public ResponseEntity<Map<String, Object>> getWopiParams(HttpServletRequest request) {
        return null;
    }

    @GetMapping("/contents")
    public ResponseEntity<?> getContent(HttpServletRequest request) {
        return null;
    }

    @PostMapping("/contents")
    public void save(HttpServletRequest request) throws IOException {
        return;
    }
}
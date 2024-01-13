package com.example.springdemo.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.util.HashMap;
import java.util.Map;

@Slf4j
@RestController
@RequestMapping("/wopi")
public class WopiController {
    private static final String filename = "filename.docx";

    @GetMapping(value = {""})
    public ResponseEntity<Map<String, Object>> getWopiParams(HttpServletRequest request) {
        Map<String, Object> res = new HashMap<>();
        res.put("UserId", "username");
        res.put("BaseFileName", filename);
        res.put("UserFriendlyName", "userFullName");
        res.put("UserCanWrite", true);
        return ResponseEntity.ok(res);
    }

    // return file content
    @GetMapping("/contents")
    public ResponseEntity<byte[]> getContent(HttpServletRequest request) {
        try {
            File file = new File(filename);

// TODO REMOVE  000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
            if (!file.exists()) {
                return ResponseEntity.ok(null);
            }
// TODO end REMOVE  000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000


            byte[] fileContent = new byte[(int) file.length()];
            try (FileInputStream fileInputStream = new FileInputStream(file)) {
                if (fileInputStream.read(fileContent) == -1) {
                    throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR, "Failed to read file content");
                }
            }

            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
            headers.setContentDispositionFormData("attachment", filename);

            return new ResponseEntity<>(fileContent, headers, HttpStatus.OK);
        } catch (Exception e) {
            log.error("WopiController.getContent exception - [{}]", e.getMessage());
            throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    // save to resource
    @PostMapping("/contents")
    public void save(HttpServletRequest request) {
        try {
            ServletInputStream inputStream = request.getInputStream();
            File file = new File(filename);

            try (FileOutputStream outputStream = new FileOutputStream(file)) {
                byte[] buffer = new byte[1024];
                int bytesRead;
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                }
            }

            inputStream.close();
        } catch (Exception e) {
            log.error("WopiController.save exception - [{}]", e.getMessage());
            throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}

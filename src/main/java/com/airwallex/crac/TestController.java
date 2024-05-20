package com.airwallex.crac;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestController {

    @Value("${application.secret}")
    private String secret;

    @GetMapping("/secret")
    public String test() {
        return "secret is: " + secret;
    }
}

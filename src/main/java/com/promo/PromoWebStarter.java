package com.promo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication(scanBasePackages = {"com.promo"})
public class PromoWebStarter {
    public static void main(String[] args) {
        SpringApplication.run(PromoWebStarter.class, args);
    }
}

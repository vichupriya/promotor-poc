package com.promo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PromoWebController {
    @RequestMapping(value="/test")
    public String test(){

        System.out.println("yiyiuyi");
        return "index";
    }
}

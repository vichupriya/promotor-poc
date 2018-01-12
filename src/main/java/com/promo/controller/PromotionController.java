package com.promo.controller;

import com.promo.bean.Account;
import com.promo.bean.Promotions;
import com.promo.service.IPromootionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class PromotionController {

    @Autowired
    IPromootionService promootionService;

    @RequestMapping(value = "/promotion")
    public ModelAndView promo() {
        ModelAndView modelAndView = new ModelAndView("createPromotion");
        modelAndView.addObject("promotion",new Promotions());
        return modelAndView;
    }
    @RequestMapping(value = "/createPromotion",method = RequestMethod.POST)
    public ModelAndView createPromotion(@ModelAttribute("promotion") Promotions promotions, @SessionAttribute(name="account") Account account) {

        promootionService.postPromotion(promotions,account);
        ModelAndView modelAndView = new ModelAndView("createPromotion");
        modelAndView.addObject("promotion",new Promotions());
        return modelAndView;
    }
}

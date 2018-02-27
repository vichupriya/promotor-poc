package com.promo.controller;

import com.promo.bean.Account;
import com.promo.bean.Promotions;
import com.promo.bean.search.PromoSearchRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import com.promo.service.IPromotionService;

import javax.validation.Valid;
import java.awt.*;
import java.util.List;

@Controller
public class PromotionController {

    @Autowired
    IPromotionService promotionService;

    @RequestMapping(value = "/promotion")
    public ModelAndView promo() {
        ModelAndView modelAndView = new ModelAndView("createPromotion");
        modelAndView.addObject("promotion",new Promotions());
        return modelAndView;
    }
    @RequestMapping(value = "/createPromotion",method = RequestMethod.POST)
    public ModelAndView createPromotion(@ModelAttribute("promotion") Promotions promotions, @SessionAttribute(name="account") Account account) {

        promotionService.postPromotion(promotions,account);
        ModelAndView modelAndView = new ModelAndView("createPromotion");
        modelAndView.addObject("promotion",new Promotions());
        return modelAndView;
    }
    @RequestMapping(value = "/activepromotions", method = RequestMethod.POST,produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public List<Promotions> getActivePromotions(@Valid @RequestBody  PromoSearchRequest promoSearchRequest) {
        return  promotionService.getRunningPromotions(promoSearchRequest);
    }
    @RequestMapping(value = "/resturantpromotions", method = RequestMethod.POST)
    public ModelAndView listActivePromotions( @Valid PromoSearchRequest promoSearchRequest,BindingResult bindingResult,
                                              Model model) {
        ModelAndView modelAndView = new ModelAndView("promoSearchHome");
        modelAndView.addObject("promoSearch",promoSearchRequest);
        modelAndView.addObject("activePromotionList",promotionService.getRunningPromotions(promoSearchRequest));
        return modelAndView;
    }
}

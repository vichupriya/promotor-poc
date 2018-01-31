package com.promo.controller;

import com.promo.bean.Account;
import com.promo.bean.Address;
import com.promo.bean.Promotions;
import com.promo.bean.geo.Location;
import com.promo.service.IAccountService;
import com.promo.service.IPromootionService;
import com.promo.util.PromoUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;


@Controller
@SessionAttributes("account")
public class PromoWebController {

    @Autowired
    IAccountService accountService;
    @Autowired
    IPromootionService promootionService;

    @RequestMapping(value = "/")
    public ModelAndView home() {
        ModelAndView modelAndView = new ModelAndView("site.home");
        modelAndView.addObject("individualAccount", new Account());
        modelAndView.addObject("loginAccount", new Account());
        return modelAndView;//new ModelAndView("home","individualAccount",new Account());
    }



    @RequestMapping(value = "/registerUser", method = RequestMethod.POST)
    public ModelAndView register(@ModelAttribute("individualAccount") Account account) {


        account.setId(System.currentTimeMillis());
        //account.setAccountType(PromoUtil.INDIVIDUAL_ACCOUNT_TYPE);
        String registrationResult = accountService.register(account);
        if (!StringUtils.isEmpty(registrationResult) && PromoUtil.SUCCESS_STATUS.equalsIgnoreCase(registrationResult)) {
            ModelAndView modelAndView = new ModelAndView("site.home");
            modelAndView.addObject("individualAccount", new Account());
            modelAndView.addObject("loginAccount", new Account());
            return modelAndView;
        } else if (!StringUtils.isEmpty(registrationResult) && "User Name Already Selected,Please try another One".equalsIgnoreCase(registrationResult)){
            ModelAndView modelAndView = new ModelAndView("businessRegistration");
            modelAndView.addObject("message", "User Name Already Selected,Please try another One");
            account.setUserName("");
            account.setAccountPassword("");
            modelAndView.addObject("individualAccount", account);
            return modelAndView;
        }
        else {
            ModelAndView modelAndView = new ModelAndView("error");
            modelAndView.addObject("individualAccount", new Account());
            modelAndView.addObject("loginAccount", new Account());
            return modelAndView;
        }
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ModelAndView login(@ModelAttribute("loginAccount") Account account) {

        Account result = accountService.authenticateUser(account);
        String targetView ="";
        if(result!=null &&  !StringUtils.isEmpty(result.getUserName())){
            String accType =result.getType();
            targetView = (",Business".equalsIgnoreCase(accType))?"promotion":"promoUserHome";
            ModelAndView modelAndView = new ModelAndView(targetView);
            modelAndView.addObject("account",result);
            return modelAndView;
        }else{
            targetView = "site.home";
            ModelAndView modelAndView = new ModelAndView(targetView);
            modelAndView.addObject("message", "Invalid UserName Or Password");
            modelAndView.addObject("individualAccount", new Account());
            modelAndView.addObject("loginAccount", new Account());
            return modelAndView;
        }



    }

    @RequestMapping(method = RequestMethod.GET, value = "/businessRegistration")
    public ModelAndView businessRegistration(Model model) {
        Account businessAccount = new Account();
        //businessAccount.setAccountType("Business");
        List<Address> businessAddressList = new ArrayList<>();
        businessAddressList.add(new Address());
        businessAccount.setAccountAddresList(businessAddressList);
      //  businessAccount.setAccountType("Business");
        ModelAndView modelAndView = new ModelAndView("businessRegistration");
        modelAndView.addObject("individualAccount", businessAccount);
        return modelAndView;
    }

    @RequestMapping(value = "/welcome")
    public String welcome() {

        System.out.println("Welcome");
        return "home";
    }

}

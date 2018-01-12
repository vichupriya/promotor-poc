package com.promo.service.impl;

import com.promo.bean.Account;
import com.promo.bean.Promotions;
import com.promo.service.IPromootionService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

@Service
public class PromotionService implements IPromootionService{
    @Autowired
    Environment environment;
    @Override
    public String postPromotion(Promotions promotions,Account account) {

        if(account !=null){
            promotions.setBusinessID(account.getId());
            promotions.setActive(true);
            promotions.setPromotionCode(System.currentTimeMillis());
            promotions.setOwnerLocation(account.getLocation());
            if(account.getAccountAddresList()!=null && !account.getAccountAddresList().isEmpty())
                promotions.setBusinessAddress(account.getAccountAddresList().get(0));
        }
        RestTemplate restTemplate = new RestTemplate();
        UriComponents uriComponents = UriComponentsBuilder.fromHttpUrl(environment.getProperty("promotion.url")).build();
        HttpEntity<Promotions> registrationHttpEntity = new HttpEntity<Promotions>(promotions);
        ResponseEntity<String> regisrationResponseEntity = restTemplate.exchange(uriComponents.toString(), HttpMethod.POST, registrationHttpEntity, String.class);
        return regisrationResponseEntity.getBody();
    }
}

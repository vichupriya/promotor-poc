package com.promo.service.impl;

import com.promo.bean.Account;
import com.promo.bean.Promotions;

import com.promo.bean.search.PromoSearchRequest;
import com.promo.bean.search.PromoSearchResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;
import com.promo.service.IPromotionService;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class PromotionService implements IPromotionService{

    final static Logger logger = LoggerFactory.getLogger(PromotionService.class);
    @Autowired
    Environment environment;
    @Override
    public String createPromotion(Promotions promotions, Account account) {

        if(account !=null){
            promotions.setBusinessID(account.getId());
            promotions.setActive(true);
           // promotions.setPromotionCode(System.currentTimeMillis());
            promotions.setOwnerLat(Double.valueOf(account.getLocation().getLat()));
            promotions.setOwnerLng(Double.valueOf(account.getLocation().getLng() ));
            promotions.setFormattedAddress(account.getLocation().getFormattedAddress());
            promotions.setContactEmail(account.getEmailAddress());
            promotions.setBusinessName(account.getBusinessName());
            promotions.setContactPhone(account.getContectPhone());
            promotions.setBusinessType(account.getBusinessType());
            if(account.getAccountAddresList()!=null && !account.getAccountAddresList().isEmpty())
                promotions.setBusinessAddress(account.getAccountAddresList().get(0));
                promotions.setPromoZipCode(account.getAccountAddresList().get(0).getZipCode());
        }
        RestTemplate restTemplate = new RestTemplate();
        UriComponents uriComponents = UriComponentsBuilder.fromHttpUrl(environment.getProperty("promotion.url")+"/").build();
        HttpEntity<Promotions> registrationHttpEntity = new HttpEntity<Promotions>(promotions);
        ResponseEntity<String> regisrationResponseEntity = restTemplate.exchange(uriComponents.toString(), HttpMethod.POST, registrationHttpEntity, String.class);
        return regisrationResponseEntity.getBody();
    }

    @Override
    public String updatePromotion(Promotions promotions) {
        RestTemplate restTemplate = new RestTemplate();
        UriComponents uriComponents = UriComponentsBuilder.fromHttpUrl(environment.getProperty("promotion.url")+"/").build();
        HttpEntity<Promotions> registrationHttpEntity = new HttpEntity<Promotions>(promotions);
        ResponseEntity<String> regisrationResponseEntity = restTemplate.exchange(uriComponents.toString(), HttpMethod.PUT, registrationHttpEntity, String.class);
        return regisrationResponseEntity.getBody();
    }

    @Override
    public List<Promotions> getRunningPromotions(PromoSearchRequest promoSearchRequest) {
        logger.info("Finding ****"+promoSearchRequest.toString());
        List<Promotions> promotionsList = new ArrayList<>();
        RestTemplate restTemplate = new RestTemplate();
        UriComponents uriComponents = UriComponentsBuilder.fromHttpUrl(environment.getProperty("promotion.url")+"/activePromotions").build();
        HttpEntity<PromoSearchRequest> httpRequestEntity = new HttpEntity<PromoSearchRequest>(promoSearchRequest);
        try {
            logger.info("Promotion URL >>"+uriComponents.toString());
            ResponseEntity<PromoSearchResponse> responseEntity = restTemplate.exchange(uriComponents.toString(), HttpMethod.POST, httpRequestEntity, PromoSearchResponse.class);


             promotionsList =  responseEntity.getBody().getActivePromotions();
            logger.info("PRetrieved data size "+promotionsList.size());
        }catch(Exception ex){
            logger.error("error getting result ");
            ex.printStackTrace();
        }
        return promotionsList;
    }
}

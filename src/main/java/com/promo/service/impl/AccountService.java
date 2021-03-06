package com.promo.service.impl;

import com.promo.bean.Account;
import com.promo.bean.Address;
import com.promo.bean.Promotions;
import com.promo.bean.geo.GeoResult;
import com.promo.bean.geo.Location;
import com.promo.service.IAccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class AccountService implements IAccountService {

    @Autowired
    Environment environment;
    @Override
    public String register(Account account) {
        try {
            if(account.getAccountAddresList()!=null && account.getAccountAddresList().size()>0)
                 account.setLocation(getLatLongForAddress(account.getAccountAddresList().get(0)));
            RestTemplate restTemplate = new RestTemplate();
            UriComponents uriComponents = UriComponentsBuilder.fromHttpUrl(environment.getProperty("account.registration.url")).build();
            HttpEntity<Account> registrationHttpEntity = new HttpEntity<Account>(account);
            ResponseEntity<String> regisrationResponseEntity = restTemplate.exchange(uriComponents.toString(), HttpMethod.POST, registrationHttpEntity, String.class);
            return regisrationResponseEntity.getBody();
        }catch(HttpClientErrorException httpException){
            httpException.printStackTrace();
            return "error";
        }catch(Exception ex){
            ex.printStackTrace();
            return "error";
        }

    }
    public Location getLatLongForAddress(Address address) {
        String addresString = address.getAddressLine1().replaceAll(" ","+");
        StringBuilder urlBuilder = new StringBuilder();

        urlBuilder.append(environment.getProperty("geo.url"));
        urlBuilder.append("address="+addresString);
        urlBuilder.append(",");
        urlBuilder.append(address.getCity());
        urlBuilder.append(",");
        urlBuilder.append(address.getState());
        urlBuilder.append("&key="+environment.getProperty("geo.api.key"));
        String geoAPIURL =urlBuilder.toString();
        Location location =null;

        try{

            RestTemplate restTemplate = new RestTemplate();
            UriComponents uriComponents = UriComponentsBuilder.fromHttpUrl(geoAPIURL).build();
            HttpEntity<String> geoHttpReqEntity = new HttpEntity<>("");
            ResponseEntity<GeoResult> regisrationResponseEntity = restTemplate.exchange(uriComponents.toString(), HttpMethod.POST, geoHttpReqEntity, GeoResult.class);
            location = regisrationResponseEntity.getBody().getResults()[0].getGeometry().getLocation();
            location.setFormattedAddress(regisrationResponseEntity.getBody().getResults()[0].getFormatted_address());
        }catch(HttpClientErrorException httpException){
          return null;
        }catch(Exception ex){
            return null;
        }
        return location;
    }
    public Account authenticateUser(Account account){
        try {
            RestTemplate restTemplate = new RestTemplate();
            UriComponents uriComponents = UriComponentsBuilder.fromHttpUrl(environment.getProperty("account.login.url")).build();
            HttpEntity<Account> loginHttpEntity = new HttpEntity<Account>(account);

            ResponseEntity<Account> loginResponseEntity = restTemplate.exchange(uriComponents.toString(), HttpMethod.POST, loginHttpEntity, Account.class);
            Account authAccount = loginResponseEntity.getBody();
            return authAccount;
        }catch(HttpClientErrorException httpException){
            if(httpException.getStatusCode()== HttpStatus.UNAUTHORIZED)
                return new Account();//"site.home";

        }catch(Exception ex){
            return null;//"error";
        }
        return account;//"promoUserHome";
    }

    @Override
    public List<Promotions> getPromotionsForAccount(long accountId) {
        try {
            RestTemplate restTemplate = new RestTemplate();
            UriComponents uriComponents = UriComponentsBuilder.fromHttpUrl(environment.getProperty("acccount.promo.lookup.url") + "/" + accountId).build();
            ResponseEntity<List> loginResponseEntity = restTemplate.getForEntity(uriComponents.toString(), List.class);
            return loginResponseEntity.getBody();
        } catch (HttpClientErrorException httpException) {
            httpException.printStackTrace();
        } catch (Exception ex) {
                ex.printStackTrace();
        }
        return  new ArrayList<>();
    }

    @Override
    public String updateAccount(Account account) {
        String url =environment.getProperty("account.url");
        RestTemplate restTemplate = new RestTemplate();
        UriComponents uriComponents = UriComponentsBuilder.fromHttpUrl(url).build();
        HttpEntity<Account> registrationHttpEntity = new HttpEntity<Account>(account);
        ResponseEntity<String> regisrationResponseEntity = restTemplate.exchange(uriComponents.toString(), HttpMethod.PUT, registrationHttpEntity, String.class);
        return regisrationResponseEntity.getBody();
    }
}

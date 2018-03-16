package com.promo.service;

import com.promo.bean.Account;
import com.promo.bean.Promotions;

import java.util.List;

public interface IAccountService {
    public String register(Account account);
    public Account authenticateUser(Account account);
    public List<Promotions> getPromotionsForAccount(long accountId);

}

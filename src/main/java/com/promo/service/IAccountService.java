package com.promo.service;

import com.promo.bean.Account;

public interface IAccountService {
    public String register(Account account);
    public Account authenticateUser(Account account);

}

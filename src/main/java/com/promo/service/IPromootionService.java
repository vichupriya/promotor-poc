package com.promo.service;

import com.promo.bean.Account;
import com.promo.bean.Promotions;

public interface IPromootionService {
    public String postPromotion(Promotions promotions,Account account);
}

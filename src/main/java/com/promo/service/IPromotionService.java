package com.promo.service;

import com.promo.bean.Account;
import com.promo.bean.Promotions;
import com.promo.bean.search.PromoSearchRequest;
import java.util.List;

public interface IPromotionService {
    public String postPromotion(Promotions promotions,Account account);
    public List<Promotions> getRunningPromotions(PromoSearchRequest promoSearchRequest);
}

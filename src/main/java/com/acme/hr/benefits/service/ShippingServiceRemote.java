package com.acme.hr.benefits.service;

import com.acme.hr.benefits.model.ShoppingCart;

public interface ShippingServiceRemote {
    double calculateShipping(ShoppingCart sc);
    double calculateShippingInsurance(ShoppingCart sc);
}

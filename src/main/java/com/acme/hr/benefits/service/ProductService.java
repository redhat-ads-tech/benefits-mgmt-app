package com.acme.hr.benefits.service;

import com.acme.hr.benefits.model.CatalogItemEntity;
import com.acme.hr.benefits.model.Product;
import com.acme.hr.benefits.utils.Transformers;

import javax.ejb.Stateless;
import javax.inject.Inject;
import java.util.List;
import java.util.stream.Collectors;

import static com.acme.hr.benefits.utils.Transformers.toProduct;

@Stateless
public class ProductService {

    @Inject
    CatalogService cm;

    public ProductService() {
    }

    public List<Product> getProducts() {
        return cm.getCatalogItems().stream().map(entity -> toProduct(entity)).collect(Collectors.toList());
    }

    public Product getProductByItemId(String itemId) {
        CatalogItemEntity entity = cm.getCatalogItemById(itemId);
        if (entity == null)
            return null;

        return Transformers.toProduct(entity);
    }
}

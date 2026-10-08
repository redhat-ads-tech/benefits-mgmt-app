package com.acme.hr.benefits.rest;

import java.io.Serializable;
import java.util.List;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;

import com.acme.hr.benefits.model.Product;
import com.acme.hr.benefits.service.ProductService;

@RequestScoped
@Path("/products")
@Consumes(MediaType.APPLICATION_JSON)
@Produces(MediaType.APPLICATION_JSON)
public class ProductEndpoint implements Serializable {

    /**
     *
     */
    private static final long serialVersionUID = -7227732980791688773L;

    @Inject
    private ProductService pm;


    @GET
    @Path("/")
    public List<Product> listAll() {
        return pm.getProducts();
    }

    @GET
    @Path("/{itemId}")
    public Product getProduct(@PathParam("itemId") String itemId) {
        return pm.getProductByItemId(itemId);
    }

}

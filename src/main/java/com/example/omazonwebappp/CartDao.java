package com.example.omazonwebappp;

import java.util.ArrayList;

public interface CartDao {

    public ArrayList<Cart> getListOfCartOfThisCustomer(int cartCustomerID);
    public void updateCart(int cartID, int cartQuantity) ;
    public void deleteCart(int cartID);
    public void addCart(Cart cart);


}

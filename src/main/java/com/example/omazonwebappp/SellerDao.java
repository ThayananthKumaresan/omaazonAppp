package com.example.omazonwebappp;

public interface SellerDao {

    public Seller getSeller(int sellerID);
    public Seller getSellerBySellerCustomerID(int sellerCustomerID);
    public void updateSeller(Seller seller);
    public void deleteSeller(int sellerID);
    public void registerSeller(Seller seller);
    public boolean loginSeller(Seller seller);
    public void updateSellerProfit(int sellerID, double income);
    public void updateSellerShopImage(Seller seller);
    public void updateSellerMainProfile(Seller seller, int sellerCustomerID);
}

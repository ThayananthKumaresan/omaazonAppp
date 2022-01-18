package com.example.omazonwebappp;

import java.util.ArrayList;

public class Seller  extends User{

    private int sellerID;
    private double sellerProfit;
    public String sellerPhoneNumber;
    public String sellerBankAccount;
    public String sellerShopAddress;
    public String sellerIC;
    public String sellerBusinessRegistrationNumber;
    public String sellerShopName;
    public String sellerShopImage;

    public ArrayList<Transaction> sellerTransactions;


    // For user to login
    public Seller( String email, String password) {
        super.setEmail(email);
        super.setPassword(password);
    }


    public Seller() {

    }

    public Seller(String email, String password,String userName,String firstName,String lastName,String sellerBankAccount, String sellerShopAddress, String sellerIC, String sellerBusinessRegistrationNumber,String sellerShopName,String sellerPhoneNumber) {
        super.setEmail(email);
        super.setPassword(password);
        super.setFirstName(firstName);
        super.setLastName(lastName);
        super.setUserName(userName);
        this.sellerProfit = 0.00;
        this.sellerBankAccount = sellerBankAccount;
        this.sellerShopAddress = sellerShopAddress;
        this.sellerIC = sellerIC;
        this.sellerBusinessRegistrationNumber = sellerBusinessRegistrationNumber;
        this.sellerShopName = sellerShopName;
        this.sellerPhoneNumber = sellerPhoneNumber;
        this.sellerShopImage = "defaultShopImage.jpg";

    }

    public Seller(double sellerProfit, String sellerUsername, String sellerEmail, String sellerPhoneNumber, String sellerBankAccount, String sellerShopAddress, String sellerPassword, String sellerIC, String sellerBusinessRegistrationNumber) {
        this.sellerProfit = sellerProfit;
        this.sellerPhoneNumber = sellerPhoneNumber;
        this.sellerBankAccount = sellerBankAccount;
        this.sellerShopAddress = sellerShopAddress;
        this.sellerIC = sellerIC;
        this.sellerBusinessRegistrationNumber = sellerBusinessRegistrationNumber;
    }

    public int getSellerID() {
        return sellerID;
    }

    public void setSellerID(int sellerID) {
        this.sellerID = sellerID;
    }

    public double getSellerProfit() {
        return sellerProfit;
    }

    public void setSellerProfit(double sellerProfit) {
        this.sellerProfit = sellerProfit;
    }

    public String getSellerPhoneNumber() {
        return sellerPhoneNumber;
    }

    public void setSellerPhoneNumber(String sellerPhoneNumber) {
        this.sellerPhoneNumber = sellerPhoneNumber;
    }

    public String getSellerBankAccount() {
        return sellerBankAccount;
    }

    public void setSellerBankAccount(String sellerBankAccount) {
        this.sellerBankAccount = sellerBankAccount;
    }

    public String getSellerShopAddress() {
        return sellerShopAddress;
    }

    public void setSellerShopAddress(String sellerShopAddress) {
        this.sellerShopAddress = sellerShopAddress;
    }

    public String getSellerIC() {
        return sellerIC;
    }

    public void setSellerIC(String sellerIC) {
        this.sellerIC = sellerIC;
    }

    public String getSellerBusinessRegistrationNumber() {
        return sellerBusinessRegistrationNumber;
    }

    public void setSellerBusinessRegistrationNumber(String sellerBusinessRegistrationNumber) {
        this.sellerBusinessRegistrationNumber = sellerBusinessRegistrationNumber;
    }

    public ArrayList<Transaction> getSellerTransactions() {
        return this.sellerTransactions;
    }

    public void setSellerTransactions(ArrayList<Transaction> sellerTransactions) {
        this.sellerTransactions = sellerTransactions;
    }

    public String getSellerShopName() {
        return sellerShopName;
    }

    public void setSellerShopName(String sellerShopName) {
        this.sellerShopName = sellerShopName;
    }

    public String getSellerShopImage() {
        return sellerShopImage;
    }

    public void setSellerShopImage(String sellerShopImage) {
        this.sellerShopImage = sellerShopImage;
    }
}

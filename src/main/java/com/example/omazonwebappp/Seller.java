package com.example.omazonwebappp;

import java.util.ArrayList;

public class Seller extends User{

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


    /**
     * Overloaded constructor for user to login
     * @param email
     * @param password
     */    public Seller(String email, String password) {
        super.setEmail(email);
        super.setPassword(password);
    }

    /**
     * Empty Constructor
     */
    public Seller() {}

    /**
     * Overloaded constructor with 11 parameter
     * @param email
     * @param password
     * @param userName
     * @param firstName
     * @param lastName
     * @param sellerBankAccount
     * @param sellerShopAddress
     * @param sellerIC
     * @param sellerBusinessRegistrationNumber
     * @param sellerShopName
     * @param sellerPhoneNumber
     */
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

    /**
     * Overloaded constructor with 9 parameter
     * @param sellerProfit
     * @param sellerUsername
     * @param sellerEmail
     * @param sellerPhoneNumber
     * @param sellerBankAccount
     * @param sellerShopAddress
     * @param sellerPassword
     * @param sellerIC
     * @param sellerBusinessRegistrationNumber
     */
    public Seller(double sellerProfit, String sellerUsername, String sellerEmail, String sellerPhoneNumber, String sellerBankAccount, String sellerShopAddress, String sellerPassword, String sellerIC, String sellerBusinessRegistrationNumber) {
        this.sellerProfit = sellerProfit;
        this.sellerPhoneNumber = sellerPhoneNumber;
        this.sellerBankAccount = sellerBankAccount;
        this.sellerShopAddress = sellerShopAddress;
        this.sellerIC = sellerIC;
        this.sellerBusinessRegistrationNumber = sellerBusinessRegistrationNumber;
    }

    /**
     * Accessor method for all attribute
     */
    public int getSellerID() {
        return sellerID;
    }
    public double getSellerProfit() {
        return sellerProfit;
    }
    public String getSellerPhoneNumber() {
        return sellerPhoneNumber;
    }
    public String getSellerBankAccount() {
        return sellerBankAccount;
    }
    public String getSellerShopAddress() {
        return sellerShopAddress;
    }
    public String getSellerIC() {
        return sellerIC;
    }
    public String getSellerBusinessRegistrationNumber() {
        return sellerBusinessRegistrationNumber;
    }
    public ArrayList<Transaction> getSellerTransactions() {
        return this.sellerTransactions;
    }
    public String getSellerShopName() {
        return sellerShopName;
    }
    public String getSellerShopImage() {
        return sellerShopImage;
    }

    /**
     * Mutator method for all attribute
     */
    public void setSellerID(int sellerID) {
        this.sellerID = sellerID;
    }
    public void setSellerProfit(double sellerProfit) {
        this.sellerProfit = sellerProfit;
    }
    public void setSellerPhoneNumber(String sellerPhoneNumber) {
        this.sellerPhoneNumber = sellerPhoneNumber;
    }
    public void setSellerBankAccount(String sellerBankAccount) {
        this.sellerBankAccount = sellerBankAccount;
    }
    public void setSellerShopAddress(String sellerShopAddress) {
        this.sellerShopAddress = sellerShopAddress;
    }
    public void setSellerIC(String sellerIC) {
        this.sellerIC = sellerIC;
    }
    public void setSellerBusinessRegistrationNumber(String sellerBusinessRegistrationNumber) {
        this.sellerBusinessRegistrationNumber = sellerBusinessRegistrationNumber;
    }
    public void setSellerTransactions(ArrayList<Transaction> sellerTransactions) {
        this.sellerTransactions = sellerTransactions;
    }
    public void setSellerShopName(String sellerShopName) {
        this.sellerShopName = sellerShopName;
    }
    public void setSellerShopImage(String sellerShopImage) {
        this.sellerShopImage = sellerShopImage;
    }
}

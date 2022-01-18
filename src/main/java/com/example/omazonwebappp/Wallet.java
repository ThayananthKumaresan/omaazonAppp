package com.example.omazonwebappp;

import java.util.ArrayList;

public class Wallet {

    int walletID ;
    double walletBalance;
    ArrayList<Transaction> walletTransaction ;

    /**
     * Empty Constructor
     * Set user wallet balance to 0.0
     * Declare wallet transaction to new ArrayList
     */
    public Wallet() {
        this.walletBalance = 0.0;
        this.walletTransaction = new ArrayList<>();
    }

    /**
     * Accessor method for all attribute
     */
    public int getWalletID() {
        return walletID;
    }
    public ArrayList<Transaction> getWalletTransaction() {
        return this.walletTransaction;
    }
    public double getWalletBalance() {
        return walletBalance;
    }

    /**
     * Mutator method for all attribute
     */
    public void setWalletID(int walletID) {
        this.walletID = walletID;
    }
    public void setWalletTransaction(ArrayList<Transaction> walletTransaction) {
        this.walletTransaction = walletTransaction;
    }
    public void setWalletBalance(double walletBalance) {
        this.walletBalance = walletBalance;
    }

}

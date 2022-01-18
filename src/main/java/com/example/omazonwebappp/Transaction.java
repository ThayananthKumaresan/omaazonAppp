package com.example.omazonwebappp;

import java.sql.Date;

public class Transaction {

    int transactionID;
    double transactionAmount;
    String transactionDateTime;
    Date transactionDate;
    int userID;

    /**
     * Overloaded constructor with 4 parameter
     * @param transactionAmount
     * @param transactionDateTime
     * @param userID
     * @param transactionDate
     */
    public Transaction(double transactionAmount, String transactionDateTime, int userID, Date transactionDate) {
        this.transactionAmount = transactionAmount;
        this.transactionDateTime = transactionDateTime;
        this.userID = userID;
        this.transactionDate = transactionDate;
    }

    /**
     * Empty Constructor
     */
    public Transaction() {}

    /**
     * Accessor method for all attribute
     */
    public int getTransactionID() {
        return transactionID;
    }
    public double getTransactionAmount() {
        return transactionAmount;
    }
    public String getTransactionDateTime() {
        return transactionDateTime;
    }
    public int getUserID() {
        return userID;
    }
    public Date getTransactionDate() {
        return transactionDate;
    }

    /**
     * Mutator method for all attribute
     */
    public void setTransactionID(int transactionID) {
        this.transactionID = transactionID;
    }
    public void setTransactionAmount(double transactionAmount) {
        this.transactionAmount = transactionAmount;
    }
    public void setTransactionDateTime(String transactionDateTime) {
        this.transactionDateTime = transactionDateTime;
    }
    public void setUserID(int userID) {
        this.userID = userID;
    }
    public void setTransactionDate(Date transactionDate) {
        this.transactionDate = transactionDate;
    }
}

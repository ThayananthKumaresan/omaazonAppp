package com.example.omazonwebappp;


import java.sql.Date;

public class Transaction {

    int transactionID;
    double transactionAmount;
    String transactionDateTime;
    Date transactionDate;

    int userID;

    public Transaction(double transactionAmount, String transactionDateTime, int userID, Date transactionDate) {
        this.transactionAmount = transactionAmount;
        this.transactionDateTime = transactionDateTime;
        this.userID = userID;
        this.transactionDate = transactionDate;
    }

    public Transaction() {
    }

    public int getTransactionID() {
        return transactionID;
    }

    public void setTransactionID(int transactionID) {
        this.transactionID = transactionID;
    }

    public double getTransactionAmount() {
        return transactionAmount;
    }

    public void setTransactionAmount(double transactionAmount) {
        this.transactionAmount = transactionAmount;
    }

    public String getTransactionDateTime() {
        return transactionDateTime;
    }

    public void setTransactionDateTime(String transactionDateTime) {

        this.transactionDateTime = transactionDateTime;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public Date getTransactionDate() {
        return transactionDate;
    }

    public void setTransactionDate(Date transactionDate) {
        this.transactionDate = transactionDate;
    }
}

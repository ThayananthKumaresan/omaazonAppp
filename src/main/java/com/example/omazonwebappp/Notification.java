package com.example.omazonwebappp;
public class Notification {

    int notificationID ;
    int notificationSellerID;
    int notificationOrderId;
    int notificationCustomerID;
    int notificationProductID;

    /**
     * Overloaded constructor with 4 parameter
     * @param notificationSellerID
     * @param notificationOrderId
     * @param notificationCustomerID
     * @param notificationProductID
     */
    public Notification(int notificationSellerID, int notificationOrderId, int notificationCustomerID, int notificationProductID) {
        this.notificationSellerID = notificationSellerID;
        this.notificationOrderId = notificationOrderId;
        this.notificationCustomerID = notificationCustomerID;
        this.notificationProductID = notificationProductID;
    }

    /**
     * Empty Constructor
     */
    public Notification() {}

    /**
     * Accessor method for all attribute
     */
    public int getNotificationID() {
        return notificationID;
    }
    public int getNotificationOrderId() {
        return notificationOrderId;
    }
    public int getNotificationSellerID() {
        return notificationSellerID;
    }
    public int getNotificationCustomerID() {
        return notificationCustomerID;
    }
    public int getNotificationProductID() {
        return notificationProductID;
    }

    /**
     * Mutator method for all attribute
     */
    public void setNotificationID(int notificationID) {
        this.notificationID = notificationID;
    }
    public void setNotificationSellerID(int notificationSellerID) {
        this.notificationSellerID = notificationSellerID;
    }
    public void setNotificationOrderId(int notificationOrderId) {
        this.notificationOrderId = notificationOrderId;
    }
    public void setNotificationCustomerID(int notificationCustomerID) {
        this.notificationCustomerID = notificationCustomerID;
    }
    public void setNotificationProductID(int notificationProductID) {
        this.notificationProductID = notificationProductID;
    }
}

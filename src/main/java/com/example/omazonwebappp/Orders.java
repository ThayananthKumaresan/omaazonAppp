package com.example.omazonwebappp;

public class Orders {

    int orderID;
    String orderStatus;
    String orderDate;
    int orderQuantity;
    String orderTrackingID;
    boolean orderReceivedOrNot;
    boolean orderRatedOrNot;
    int orderSellerID;
    int orderProductID;
    int orderCustomerID;

    /**
     * Empty Constructor
     */
    public Orders() {}

    /**
     * Overloaded constructor with 9 parameter
     * @param orderStatus
     * @param orderDate
     * @param orderCustomerID
     * @param orderReceivedOrNot
     * @param orderTrackingID
     * @param orderRatedOrNot
     * @param orderSellerID
     * @param orderProductID
     * @param orderQuantity
     */
    public Orders(String orderStatus, String orderDate,
                  int orderCustomerID, boolean orderReceivedOrNot,
                  String orderTrackingID, boolean orderRatedOrNot,
                  int orderSellerID, int orderProductID,
                  int orderQuantity) {
        this.orderStatus = orderStatus;
        this.orderID = 0;
        this.orderDate = orderDate;
        this.orderCustomerID = orderCustomerID;
        this.orderReceivedOrNot = orderReceivedOrNot;
        this.orderTrackingID = orderTrackingID;
        this.orderRatedOrNot = orderRatedOrNot;
        this.orderSellerID = orderSellerID;
        this.orderProductID = orderProductID;
        this.orderQuantity = orderQuantity;
    }

    /**
     * Accessor method for all attribute
     */
    public String getOrderStatus() {
        return orderStatus;
    }
    public int getOrderID() {
        return orderID;
    }
    public String getOrderDate() {
        return orderDate;
    }
    public int getOrderCustomerID() {
        return orderCustomerID;
    }
    public boolean getOrderReceivedOrNot() {
        return orderReceivedOrNot;
    }
    public String getOrderTrackingID() {
        return orderTrackingID;
    }
    public boolean getOrderRatedOrNot() {
        return orderRatedOrNot;
    }
    public int getOrderSellerID() {
        return orderSellerID;
    }
    public int getOrderProductID() {
        return orderProductID;
    }
    public int getOrderQuantity() {
        return orderQuantity;
    }

    /**
     * Mutator method for all attribute
     */
    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }
    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }
    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }
    public void setOrderCustomerID(int orderCustomerID) {
        this.orderCustomerID = orderCustomerID;
    }
    public void setOrderReceivedOrNot(boolean orderReceivedOrNot) {
        this.orderReceivedOrNot = orderReceivedOrNot;
    }
    public void setOrderTrackingID(String orderTrackingID) {
        this.orderTrackingID = orderTrackingID;
    }
    public void setOrderRatedOrNot(boolean orderRatedOrNot) {
        this.orderRatedOrNot = orderRatedOrNot;
    }
    public void setOrderSellerID(int orderSellerID) {
        this.orderSellerID = orderSellerID;
    }
    public void setOrderProductID(int orderProductID) {
        this.orderProductID = orderProductID;
    }
    public void setOrderQuantity(int orderQuantity) {
        this.orderQuantity = orderQuantity;
    }
}

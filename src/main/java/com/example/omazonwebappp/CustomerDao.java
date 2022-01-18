package com.example.omazonwebappp;

public interface CustomerDao {

    public Customer getCustomer(int customerID) ;
    public void updateCustomerProfile(Customer cust);
    public void updateCustomerPassword(Customer cust);
    public void updateCustomerProfileImage(Customer cust);
    public void updateCustomerAsSeller(Customer cust);
    public void deleteCustomer(Customer cust);
    public void registerCustomer(Customer cust);
    public boolean loginCustomer(Customer cust);
    public boolean checkPaymentPassword(String paymentPassword, int customerID);
    public String getCustomerUsername(int customerID);
    public String getCustomerFullName(int customerID);
    public int checkExistingEmail(String email);
    public int checkExistingUsername(String username);
}

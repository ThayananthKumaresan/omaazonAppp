package com.example.omazonwebappp;

public class Customer extends User{

    private String paymentPassword;
    private String address ;
    private int customerID;
    private Wallet userWallet;
    private String contactNum ;
    private String profileImage ;
    private boolean registeredAsSeller ;

    /**
     * Overloaded Constructor to create new user
     * @param email
     * @param password
     * @param userName
     * @param firstName
     * @param lastName
     * @param paymentPassword
     * @param address
     * @param contactNum
     */
    public Customer(String email, String password,String userName,String firstName,String lastName,  String paymentPassword, String address,String contactNum) {
        super.setEmail(email);
        super.setPassword(password);
        super.setFirstName(firstName);
        super.setLastName(lastName);
        super.setUserName(userName);
        this.paymentPassword = paymentPassword;
        this.contactNum= contactNum;
        this.address = address;
        this.customerID = 0;
        this.userWallet = null;
        this.registeredAsSeller = false;
        this.profileImage = "profile.jpg";

    }

    /**
     * Empty Constructor for new user when register
     */
    public Customer( ) {
        this.customerID = 0;
        this.paymentPassword = "";
        this.address =  "";
        this.userWallet =  new Wallet();
    }

    /**
     * Overloaded Constructor for user to login
     * @param email
     * @param password
     */    public Customer( String email, String password) {
        super.setEmail(email);
        super.setPassword(password);
    }

    /**
     * Accessor method for all attribute
     */
    public String getProfileImage() {
        return profileImage;
    }
    public String getContactNum() {
        return contactNum;
    }
    public int getCustomerID() {
        return customerID;
    }
    public Wallet getUserWallet() {
        return userWallet;
    }
    public String getPaymentPassword() {
        return paymentPassword;
    }
    public String getAddress() {
        return address;
    }
    public boolean getRegisteredAsSeller() {
        return registeredAsSeller;
    }

    /**
     * Mutator method for all attribute
     */
    public void setProfileImage(String profileImage) {
        this.profileImage = profileImage;
    }
    public void setContactNum(String contactNum) {
        this.contactNum = contactNum;
    }
    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }
    public void setUserWallet(Wallet userWallet) {
        this.userWallet = userWallet;
    }
    public void setPaymentPassword(String paymentPassword) {
        this.paymentPassword = paymentPassword;
    }
    public void setAddress(String address) {
        this.address = address;
    }
    public void setRegisteredAsSeller(boolean registeredAsSeller) {
        this.registeredAsSeller = registeredAsSeller;
    }
}

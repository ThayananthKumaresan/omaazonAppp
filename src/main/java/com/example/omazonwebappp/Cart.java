package com.example.omazonwebappp;

/**
 * Represents a Cart.
 * Function : To store cart details
 */
public class Cart {

    int cartID;  /** To store cart ID **/
    int cartProductID; /** To store cart ID **/
    int cartCustomerID; /** To store cart ID **/
    int cartQuantity; /** To store cart ID **/

    /** Constructors with no arguments **/
    public Cart() {
    }

    /** Constructors with  arguments
     * @param cartCustomerID To store cart Customer ID
     *
     * **/
    public Cart(int cartProductID, int cartQuantity, int cartCustomerID) {
        this.cartProductID = cartProductID;
        this.cartQuantity = cartQuantity;
        this.cartCustomerID = cartCustomerID;
    }
    /** Getter methods
     * @return cart ID
     * **/
    public int getCartID() {
        return cartID;
    }

    public void setCartID(int cartID) {
        this.cartID = cartID;
    }

    public int getCartCustomerID() {
        return cartCustomerID;
    }

    public void setCartCustomerID(int cartCustomerID) {
        this.cartCustomerID = cartCustomerID;
    }

    public int getCartProductID() {
        return cartProductID;
    }

    public void setCartProductID(int cartProductID) {
        this.cartProductID = cartProductID;
    }

    public int getCartQuantity() {
        return cartQuantity;
    }

    public void setCartQuantity(int cartQuantity) {
        this.cartQuantity = cartQuantity;
    }

}

package com.example.omazonwebappp;


public class Favorites {

    int favoriteID;
    int favoritesProductID;
    int favoritesCustomerID;

    /**
     * Overloaded Constructor with 3 parameter
     * @param favoritesProductID
     * @param favoritesCustomerID
     */
    public Favorites(int favoritesProductID, int favoritesCustomerID) {
        this.favoritesProductID = favoritesProductID;
        this.favoritesCustomerID = favoritesCustomerID;
    }

    /**
     * Empty Constructor
     */
    public Favorites() {
        this.favoritesProductID = 0;
        this.favoritesCustomerID = 0;
    }

    /**
     * Accessor method for all attribute
     */
    public int getFavoritesProductID() {
        return favoritesProductID;
    }
    public int getFavoritesCustomerID() {
        return favoritesCustomerID;
    }

    /**
     * Mutator method for all attribute
     */
    public void setFavoritesProductID(int favoritesProductID) {
        this.favoritesProductID = favoritesProductID;
    }
    public void setFavoritesCustomerID(int favoritesCustomerID) {
        this.favoritesCustomerID = favoritesCustomerID;
    }
    public void setFavoriteID(int favoriteID) {
        this.favoriteID = favoriteID;
    }
}

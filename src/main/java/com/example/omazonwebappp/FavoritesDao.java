package com.example.omazonwebappp;

import java.util.ArrayList;

public interface FavoritesDao {

    public void deleteFavorites(int productIDForWishlist);
    public void addFavorites(Favorites favorite);
    public ArrayList<Favorites> getListOfFavorites(int customerID);



}

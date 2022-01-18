package com.example.omazonwebappp;

import java.sql.*;
import java.util.ArrayList;

public class FavoritesDaoImp implements FavoritesDao{

    private static final String FIND_LIST_OF_FAVORITES_BY_CUSTOMER = "SELECT * FROM favorites WHERE favoritesCustomerID=?";
    private static final String INSERT = "INSERT INTO favorites (favoritesProductID  ,favoritesCustomerID) VALUES (?,?)";
    private static final String DELETE = "DELETE FROM favorites WHERE favoritesProductID=?";



    @Override
    public void deleteFavorites(int productIDForWishlist) {
        PreparedStatement stmnt = null;
        Connection conn = null;

        try {
            conn = MySQLJDBCUtil.getConnection();
            stmnt = conn.prepareStatement(DELETE);
            stmnt.setInt(1, productIDForWishlist);

            stmnt.executeUpdate();

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            try {
                if (stmnt != null) stmnt.close();
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
            try {
                if (conn != null) conn.close();
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
        }

    }

    @Override
    public void addFavorites(Favorites favorites) {
        ResultSet rs = null;
        Connection conn;
        PreparedStatement stmnt;

        try {

            conn = MySQLJDBCUtil.getConnection();
            stmnt = conn.prepareStatement(INSERT, Statement.RETURN_GENERATED_KEYS);

            stmnt.setInt(1, favorites.getFavoritesProductID ());
            stmnt.setInt(2, favorites.getFavoritesCustomerID());

            stmnt.executeUpdate(); // Executing the sql query

            rs = stmnt.getGeneratedKeys();

            if (rs.next()) {
                favorites.setFavoriteID(rs.getInt(1)); //Setting the product ID
            }

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            try {
                if (rs != null) rs.close();
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
        }



    }

    @Override
    public ArrayList<Favorites> getListOfFavorites(int customerID) {

        ArrayList<Favorites> listOfFavoritesOfThisCustomer = new ArrayList<>();

        ResultSet rs = null;
        Connection conn;
        PreparedStatement stmnt;

        try {

            conn = MySQLJDBCUtil.getConnection();
            stmnt = conn.prepareStatement(FIND_LIST_OF_FAVORITES_BY_CUSTOMER);

            stmnt.setInt(1, customerID);
            rs = stmnt.executeQuery(); // Executing the sql query

            while (rs.next()) {
                Favorites favorites = new Favorites();
                favorites.setFavoritesCustomerID(rs.getInt("favoritesCustomerID"));
                favorites.setFavoritesProductID(rs.getInt("favoritesProductID"));
                listOfFavoritesOfThisCustomer.add(favorites);
            }

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            try {
                if (rs != null) rs.close();
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
        }

        if(listOfFavoritesOfThisCustomer.size()==0 ){
            return null;
        }else{
            return listOfFavoritesOfThisCustomer;
        }
    }


}

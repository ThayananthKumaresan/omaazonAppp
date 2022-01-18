package com.example.omazonwebappp;

import java.sql.*;
import java.util.ArrayList;


public class CartDaoImp implements CartDao{

    private static final String FIND_LIST_OF_CART_BY_CUSTOMER = "SELECT * FROM cart WHERE cartCustomerID=?";
    private static final String INSERT = "INSERT INTO cart (cartCustomerID ,cartProductID , cartQuantity) VALUES (?,?,?)";
    private static final String INSERT_WHEN_PRODUCT_IS_PRESENT = "UPDATE cart SET  cartQuantity=? WHERE cartCustomerID=? and cartProductID=?";
    private static final String DELETE = "DELETE FROM cart WHERE cartID=?";
    private static final String FIND_PRESENCE_OF_PRODUCT = "SELECT * FROM cart WHERE cartCustomerID=? and cartProductID=?";
    private static final String UPDATE_CART = "UPDATE cart SET  cartQuantity=? WHERE cartID=?";

    /**
     * This method read the product of customer cart
     * @param cartCustomerID
     * @return listOfCartOfThisCustomer
     */
    @Override
    public  ArrayList<Cart> getListOfCartOfThisCustomer(int cartCustomerID) {
        ArrayList<Cart> listOfCartOfThisCustomer = new ArrayList<>();
        ResultSet rs = null;
        Connection conn;
        PreparedStatement stmnt;
        try {
            conn = MySQLJDBCUtil.getConnection();
            stmnt = conn.prepareStatement(FIND_LIST_OF_CART_BY_CUSTOMER);
            stmnt.setInt(1, cartCustomerID);
            rs = stmnt.executeQuery(); // Executing the sql query
            while (rs.next()) {
                Cart cart = new Cart();
                cart.setCartCustomerID(rs.getInt("cartCustomerID"));
                cart.setCartID(rs.getInt("cartID"));
                cart.setCartQuantity(rs.getInt("cartQuantity"));
                cart.setCartProductID(rs.getInt("cartProductID"));
                listOfCartOfThisCustomer.add(cart);
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
        if(listOfCartOfThisCustomer.size()==0){
            return null;
        }else {
            return listOfCartOfThisCustomer;
        }
    }


    /**
     * This method update cart
     * @param cartID
     * @param cartQuantity
     */
    @Override
    public void updateCart(int cartID, int cartQuantity) {
        ResultSet rs = null;
        Connection conn;
        PreparedStatement stmnt;
        try {
            conn = MySQLJDBCUtil.getConnection();
            stmnt = conn.prepareStatement(UPDATE_CART);
            stmnt.setInt(1, cartQuantity);
            stmnt.setInt(2, cartID);
            stmnt.executeUpdate();
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

    /**
     * This method delete cart
     * @param cartID
     */
    @Override
    public void deleteCart(int cartID) {
        PreparedStatement stmnt = null;
        Connection conn = null;
        try {
            conn = MySQLJDBCUtil.getConnection();
            stmnt = conn.prepareStatement(DELETE);
            stmnt.setInt(1, cartID);
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

    /**
     * This method add cart
     * @param cart
     */
    @Override
    public void addCart(Cart cart) {
        boolean foundProductFlag = false;
        ResultSet rs = null;
        Connection conn;
        PreparedStatement stmnt;
        try {
            conn = MySQLJDBCUtil.getConnection();
            stmnt = conn.prepareStatement(FIND_PRESENCE_OF_PRODUCT);
            stmnt.setInt(1, cart.getCartCustomerID());
            stmnt.setInt(2, cart.getCartProductID());
            rs = stmnt.executeQuery(); // Executing the sql query
            Cart cart2= new Cart();
            while (rs.next()) {
                foundProductFlag= true;
                cart2.setCartQuantity(rs.getInt("cartQuantity"));
            }
            if(foundProductFlag){
                stmnt = conn.prepareStatement(INSERT_WHEN_PRODUCT_IS_PRESENT);
                stmnt.setInt(1, cart2.getCartQuantity()+cart.getCartQuantity());
                stmnt.setInt(2, cart.getCartCustomerID());
                stmnt.setInt(3, cart.getCartProductID());
                stmnt.executeUpdate();
            }else{
                stmnt = conn.prepareStatement(INSERT, Statement.RETURN_GENERATED_KEYS);
                stmnt.setInt(1, cart.getCartCustomerID());
                stmnt.setInt(2, cart.getCartProductID());
                stmnt.setInt(3, cart.getCartQuantity());
                stmnt.executeUpdate(); // Executing the sql query
                rs = stmnt.getGeneratedKeys();
                if (rs.next()) {
                    cart.setCartID(rs.getInt(1)); //Setting the product ID
                }
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
}

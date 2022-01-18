package com.example.omazonwebappp;

import java.sql.*;
import java.util.ArrayList;

import static com.example.omazonwebappp.DAOObjects.*;

public class SellerDaoImp implements SellerDao {

    private static final String FIND_BY_EMAIL_AND_PASSWORD = "SELECT * FROM seller WHERE email=? and password=? and deletedFlag=false";

    private static final String INSERT = "INSERT INTO seller (" +
            "userName, email, password, firstName, lastName, " +
            "sellerPhoneNumber, sellerBankAccount, sellerAddress, " +
            "sellerIC, sellerBusinessRegistrationNumber, sellerProfit,sellerShopName,sellerShopImage,sellerCustomerID,deletedFlag ) " +
            "VALUES (?, ?, ?, ?, ?, ?, ?,?, ?, ?, ?,?,?,?,?)";
    private static final String UPDATE_SELLER_PROFILE = "" +
            "UPDATE seller SET sellerPhoneNumber=?, sellerBankAccount=?, sellerAddress=?, " +
            "sellerIC=?, sellerBusinessRegistrationNumber=? WHERE sellerID=?";
    private static final String UPDATE_SELLER_PROFIT = "UPDATE seller " +
            "SET  sellerProfit=?" +
            "WHERE sellerID=?";
    private static final String UPDATE_SELLER_IMAGE = "UPDATE seller " +
            "SET  sellerShopImage=?" +
            "WHERE sellerID=?";
    private static final String FIND_BY_ID = "SELECT * FROM seller WHERE sellerID=?";
    private static final String FIND_BY_SELLER_CUSTOMER_ID = "SELECT * FROM seller WHERE sellerCustomerID=?";

    private static final String UPDATE_SELLER_MAIN_PROFILE = "UPDATE seller SET userName=?, email=?, firstName=?, lastName=?, password=? WHERE sellerCustomerID=?";
    private static final String DELETE = "UPDATE seller SET deletedFlag=? WHERE sellerCustomerID=?";

    @Override
    public Seller getSeller(int sellerID) {


        ResultSet rs = null;
        Connection conn;
        PreparedStatement stmnt;
        Seller seller = new Seller();

        try {

            conn = MySQLJDBCUtil.getConnection();
            stmnt = conn.prepareStatement(FIND_BY_ID);

            stmnt.setInt(1, sellerID);
            rs = stmnt.executeQuery(); // Executing the sql query

            while (rs.next()) {
               seller.setUserName(rs.getString("userName"));
               seller.setEmail(rs.getString("email"));
               seller.setFirstName(rs.getString("firstName"));
               seller.setLastName(rs.getString("lastName"));
               seller.setSellerPhoneNumber(rs.getString("sellerPhoneNumber"));
               seller.setSellerBusinessRegistrationNumber(rs.getString("sellerBusinessRegistrationNumber"));
                seller.setSellerBankAccount(rs.getString("sellerBankAccount"));
                seller.setSellerIC(rs.getString("sellerIC"));
                seller.setSellerShopAddress(rs.getString("sellerAddress"));
                seller.setSellerShopName(rs.getString("sellerShopName"));
                seller.setSellerProfit(rs.getDouble("sellerProfit"));
                seller.setSellerShopImage(rs.getString("sellerShopImage"));

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

        return seller;


    }

    @Override
    public Seller getSellerBySellerCustomerID(int sellerCustomerID) {

        System.out.println("getSellerBySellerCustomerID");
        ResultSet rs = null;
        Connection conn;
        PreparedStatement stmnt;
        Seller seller = new Seller();

        try {
            conn = MySQLJDBCUtil.getConnection();
            stmnt = conn.prepareStatement(FIND_BY_SELLER_CUSTOMER_ID);

            stmnt.setInt(1, sellerCustomerID);
            System.out.println(stmnt);

            rs = stmnt.executeQuery(); // Executing the sql query

            while (rs.next()) {
                seller.setSellerID(rs.getInt("sellerID"));
                seller.setUserName(rs.getString("userName"));
                seller.setEmail(rs.getString("email"));
                seller.setFirstName(rs.getString("firstName"));
                seller.setLastName(rs.getString("lastName"));
                seller.setSellerPhoneNumber(rs.getString("sellerPhoneNumber"));
                seller.setSellerBusinessRegistrationNumber(rs.getString("sellerBusinessRegistrationNumber"));
                seller.setSellerBankAccount(rs.getString("sellerBankAccount"));
                seller.setSellerIC(rs.getString("sellerIC"));
                seller.setSellerShopAddress(rs.getString("sellerAddress"));
                seller.setSellerShopName(rs.getString("sellerShopName"));
                seller.setSellerProfit(rs.getDouble("sellerProfit"));
                seller.setSellerShopImage(rs.getString("sellerShopImage"));

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

        return seller;


    }

    @Override
    public void updateSeller(Seller seller) {
        PreparedStatement stmnt = null;
        Connection conn = null;

        try {
            conn = MySQLJDBCUtil.getConnection();
            stmnt = conn.prepareStatement(UPDATE_SELLER_PROFILE);

            // ADDING SHOP NAME IN DB AND HERE
            stmnt.setString(1, seller.getSellerPhoneNumber());
            stmnt.setString(2, seller.getSellerBankAccount());
            stmnt.setString(3, seller.getSellerShopAddress());
            stmnt.setString(4, seller.getSellerIC());
            stmnt.setString(5, seller.getSellerBusinessRegistrationNumber());
            stmnt.setInt(6, seller.getSellerID());

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
    public void updateSellerShopImage(Seller seller) {
        PreparedStatement stmnt = null;
        Connection conn = null;

        try {
            conn = MySQLJDBCUtil.getConnection();
            stmnt = conn.prepareStatement(UPDATE_SELLER_IMAGE);

            // ADDING SHOP NAME IN DB AND HERE
            stmnt.setString(1, seller.getSellerShopImage());
            stmnt.setInt(2, seller.getSellerID());

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
    public void updateSellerMainProfile(Seller seller,int sellerCustomerID) {
        PreparedStatement stmnt = null;
        Connection conn = null;

        try {
            conn = MySQLJDBCUtil.getConnection();
            stmnt = conn.prepareStatement(UPDATE_SELLER_MAIN_PROFILE);

            // ADDING SHOP NAME IN DB AND HERE
            stmnt.setString(1, seller.getUserName());
            stmnt.setString(2, seller.getEmail());
            stmnt.setString(3, seller.getFirstName());
            stmnt.setString(4, seller.getLastName());
            stmnt.setString(5, seller.getPassword());
            stmnt.setInt(6, sellerCustomerID);

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
    public void deleteSeller(int sellerCustomerID) {

        PreparedStatement stmnt = null;
        Connection conn = null;

        try {
            conn = MySQLJDBCUtil.getConnection();
            stmnt = conn.prepareStatement(DELETE);
            stmnt.setBoolean(1, true);
            stmnt.setInt(2, sellerCustomerID);
            System.out.println(stmnt);

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

        ArrayList<Product>listOfProductsOfThisSeller = productDAO.getListOfProductsOfThisSeller(getSellerBySellerCustomerID(sellerCustomerID).getSellerID());
        for (int i = 0; i < listOfProductsOfThisSeller.size(); i++) {
            productDAO.deleteProduct(listOfProductsOfThisSeller.get(i));

        }
    }

    @Override
    public void registerSeller(Seller seller) {

        ResultSet rs = null;
        Connection conn ;
        PreparedStatement stmnt;

        try {

            conn = MySQLJDBCUtil.getConnection();
            stmnt = conn.prepareStatement(INSERT, Statement.RETURN_GENERATED_KEYS);

            stmnt.setString(1, seller.getUserName());
            stmnt.setString(2, seller.getEmail());
            stmnt.setString(3, seller.getPassword());
            stmnt.setString(4, seller.getFirstName());
            stmnt.setString(5, seller.getLastName());
            stmnt.setString(6, seller.getSellerPhoneNumber());
            stmnt.setString(7, seller.getSellerBankAccount());
            stmnt.setString(8, seller.getSellerShopAddress());
            stmnt.setString(9, seller.getSellerIC());
            stmnt.setString(10, seller.getSellerBusinessRegistrationNumber());
            stmnt.setDouble(11, 0.00);
            stmnt.setString(12, seller.getSellerShopName());
            stmnt.setString(13, seller.getSellerShopImage());
            stmnt.setInt(14, sessionCustomer.getCustomerID());
            stmnt.setBoolean(15, false);

            stmnt.executeUpdate(); // Executing the sql query
            rs = stmnt.getGeneratedKeys();

            if (rs.next()) {
                seller.setSellerID(rs.getInt(1)); //Setting the seller ID
            }


        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            try {
                if(rs != null)  rs.close();
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
        }

    }

    @Override
    public boolean loginSeller(Seller seller) {
        boolean loginSuccessFlag = false;

        ResultSet rs = null;
        PreparedStatement stmnt = null;
        Connection conn = null;

        try {
            conn = MySQLJDBCUtil.getConnection();
            stmnt = conn.prepareStatement(FIND_BY_EMAIL_AND_PASSWORD);
            stmnt.setString(1, seller.getEmail());
            stmnt.setString(2, seller.getPassword());

            rs = stmnt.executeQuery();
            if (rs.next()) {
                sessionSeller.setSellerID(rs.getInt("sellerID"));
                sessionSeller.setUserName(rs.getString("userName"));
                sessionSeller.setEmail(rs.getString("email"));
                sessionSeller.setPassword(rs.getString("password"));
                sessionSeller.setFirstName(rs.getString("firstName"));
                sessionSeller.setLastName(rs.getString("lastName"));
                sessionSeller.setSellerPhoneNumber((rs.getString("sellerPhoneNumber")));
                sessionSeller.setSellerBankAccount(rs.getString("sellerBankAccount"));
                sessionSeller.setSellerShopAddress(rs.getString("sellerAddress"));
                sessionSeller.setSellerIC(rs.getString("sellerIC"));
                sessionSeller.setSellerBusinessRegistrationNumber(rs.getString("sellerBusinessRegistrationNumber"));
                sessionSeller.setSellerProfit(rs.getDouble("sellerProfit"));
                sessionSeller.setSellerShopImage(rs.getString("sellerShopImage"));

                loginSuccessFlag = true;
            }

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            try {
                if (rs != null) rs.close();
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }

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

        sessionSeller.setSellerTransactions(transactionDAO.getListOfSellerTransaction(sessionSeller.getSellerID()));
        return loginSuccessFlag;

    }

    @Override
    public void updateSellerProfit(int sellerID , double income){

        PreparedStatement stmnt = null;
        Connection conn = null;

        try {
            conn = MySQLJDBCUtil.getConnection();
            stmnt = conn.prepareStatement(UPDATE_SELLER_PROFIT);
            stmnt.setDouble(1, getSeller(sellerID).getSellerProfit()+income);
            stmnt.setInt(2, sellerID);

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


}

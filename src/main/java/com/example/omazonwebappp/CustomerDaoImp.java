package com.example.omazonwebappp;

import java.sql.*;

import static com.example.omazonwebappp.DAOObjects.*;

public class CustomerDaoImp implements CustomerDao{

    private static final String DELETE = "UPDATE customer SET deletedFlag=? WHERE customerID=?";
    private static final String FIND_BY_EMAIL_AND_PASSWORD = "SELECT * FROM customer WHERE email=? and password=? and deletedFlag=?";
    private static final String INSERT = "INSERT INTO customer (userName, email, password, firstName, lastName, paymentPassword, address,contactNum,registeredAsSeller,profileImage,deletedFlag) VALUES (?, ?, ?, ?, ?, ?, ?,?,?,?,?)";
    private static final String UPDATE = "UPDATE customer SET userName=?, email=?, firstName=?, lastName=?, address=? , contactNum=? WHERE customerID=?";
    private static final String UPDATE_PASSWORD = "UPDATE customer SET password=?, paymentPassword=? WHERE customerID=?";
    private static final String UPDATE_PROFILE_IMAGE= "UPDATE customer SET profileImage=? WHERE customerID=?";
    private static final String UPDATE_AS_SELLER= "UPDATE customer SET registeredAsSeller=? WHERE customerID=?";
    private static final String FIND_CUSTOMER_USERNAME = "SELECT userName FROM customer WHERE customerID=?";
    private static final String FIND_CUSTOMER_FULL_NAME = "SELECT firstName, lastName FROM customer WHERE customerID=?";
    private static final String FIND_BY_ID = "SELECT * FROM customer WHERE customerID=?";
    private static final String FIND_CUSTOMER_BY_EMAIL = "SELECT customerID FROM customer WHERE email=? and deletedFlag=?";
    private static final String FIND_CUSTOMER_BY_USERNAME = "SELECT customerID FROM customer WHERE userName=? and deletedFlag=?";


    /**
     * @param customerID
     * @return Customer
     * Function : To get customer
     */
    @Override
    public Customer getCustomer(int customerID) {

        ResultSet rs = null;
        Connection conn;
        PreparedStatement stmnt;

        Customer customer = new Customer();

        try {

            conn = MySQLJDBCUtil.getConnection();
            stmnt = conn.prepareStatement(FIND_BY_ID);

            stmnt.setInt(1, customerID);
            rs = stmnt.executeQuery(); // Executing the sql query

            while (rs.next()) {
                customer.setCustomerID(rs.getInt("customerID"));
                customer.setUserName(rs.getString("userName"));
                customer.setEmail(rs.getString("email"));
                customer.setPassword(rs.getString("password"));
                customer.setFirstName(rs.getString("firstName"));
                customer.setLastName(rs.getString("lastName"));
                customer.setPaymentPassword((rs.getString("paymentPassword")));
                customer.setAddress(rs.getString("address"));
                customer.setContactNum(rs.getString("contactNum"));
                customer.setProfileImage(rs.getString("profileImage"));
                customer.setRegisteredAsSeller(rs.getBoolean("registeredAsSeller"));
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

        customer.setUserWallet(walletDAO.getCustomerWallet(customer.getCustomerID()));

        return customer;
    }

    @Override
    public void updateCustomerPassword(Customer cust) {

        PreparedStatement stmnt = null;
        Connection conn = null;

        try {
            conn = MySQLJDBCUtil.getConnection();
            stmnt = conn.prepareStatement(UPDATE_PASSWORD);
            stmnt.setString(1, cust.getPassword());
            stmnt.setString(2, cust.getPaymentPassword());
            stmnt.setInt(3, cust.getCustomerID());

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
    public void updateCustomerProfileImage(Customer cust) {

        PreparedStatement stmnt = null;
        Connection conn = null;

        try {
            conn = MySQLJDBCUtil.getConnection();
            stmnt = conn.prepareStatement(UPDATE_PROFILE_IMAGE);
            stmnt.setString(1, cust.getProfileImage());
            stmnt.setInt(2, cust.getCustomerID());

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
    public void updateCustomerAsSeller(Customer cust) {

        PreparedStatement stmnt = null;
        Connection conn = null;

        try {
            conn = MySQLJDBCUtil.getConnection();
            stmnt = conn.prepareStatement(UPDATE_AS_SELLER);
            stmnt.setBoolean(1, true);
            stmnt.setInt(2, cust.getCustomerID());

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
    public void updateCustomerProfile(Customer cust) {

        PreparedStatement stmnt = null;
        Connection conn = null;
        try {
            conn = MySQLJDBCUtil.getConnection();
            stmnt = conn.prepareStatement(UPDATE);
            stmnt.setString(1, cust.getUserName());
            stmnt.setString(2, cust.getEmail());
            stmnt.setString(3, cust.getFirstName());
            stmnt.setString(4, cust.getLastName());
            stmnt.setString(5, cust.getAddress());
            stmnt.setString(6, cust.getContactNum());
            stmnt.setInt(7, cust.getCustomerID());

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
    public void deleteCustomer(Customer cust) {

        walletDAO.deleteWallet(cust.getUserWallet());

        PreparedStatement stmnt = null;
        Connection conn = null;

        try {
            conn = MySQLJDBCUtil.getConnection();
            stmnt = conn.prepareStatement(DELETE);
            stmnt.setBoolean(1, true);
            stmnt.setInt(2, cust.getCustomerID());
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

        if(cust.getRegisteredAsSeller()){
            sellerDAO.deleteSeller(cust.getCustomerID());
        }
        sessionCustomer.setCustomerID(0);
    }

    @Override
    public void registerCustomer(Customer cust) {

        ResultSet rs = null;
        Connection conn ;
        PreparedStatement stmnt;

        try {

            conn = MySQLJDBCUtil.getConnection();
            stmnt = conn.prepareStatement(INSERT, Statement.RETURN_GENERATED_KEYS);


            stmnt.setString(1, cust.getUserName());
            stmnt.setString(2, cust.getEmail());
            stmnt.setString(3, cust.getPassword());
            stmnt.setString(4, cust.getFirstName());
            stmnt.setString(5, cust.getLastName());
            stmnt.setString(6, cust.getPaymentPassword());
            stmnt.setString(7, cust.getAddress());
            stmnt.setString(8, cust.getContactNum());
            stmnt.setBoolean(9, cust.getRegisteredAsSeller());
            stmnt.setString(10, cust.getProfileImage());
            stmnt.setBoolean(11,false);

            stmnt.executeUpdate(); // Executing the sql query
            rs = stmnt.getGeneratedKeys();

            if (rs.next()) {
                cust.setCustomerID(rs.getInt(1)); //Setting the customer ID
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


        walletDAO.createWallet(cust.getCustomerID());

    }

    @Override
    public boolean loginCustomer(Customer cust  ) {

        boolean loginSuccessFlag = false;

        ResultSet rs = null;
        PreparedStatement stmnt = null;
        Connection conn = null;

        try {
            conn = MySQLJDBCUtil.getConnection();
            stmnt = conn.prepareStatement(FIND_BY_EMAIL_AND_PASSWORD);
            stmnt.setString(1, cust.getEmail());
            stmnt.setString(2, cust.getPassword());
            stmnt.setBoolean(3, false);

            rs = stmnt.executeQuery();
            if (rs.next()) {

                sessionCustomer.setCustomerID(rs.getInt("customerID"));
                sessionCustomer.setUserName(rs.getString("userName"));
                sessionCustomer.setEmail(rs.getString("email"));
                sessionCustomer.setPassword(rs.getString("password"));
                sessionCustomer.setFirstName(rs.getString("firstName"));
                sessionCustomer.setLastName(rs.getString("lastName"));
                sessionCustomer.setPaymentPassword((rs.getString("paymentPassword")));
                sessionCustomer.setAddress(rs.getString("address"));
                sessionCustomer.setContactNum(rs.getString("contactNum"));
                sessionCustomer.setProfileImage(rs.getString("profileImage"));
                sessionCustomer.setRegisteredAsSeller(rs.getBoolean("registeredAsSeller"));

                loginSuccessFlag = true;
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

        sessionCustomer.setUserWallet(walletDAO.getCustomerWallet(sessionCustomer.getCustomerID()));

        return loginSuccessFlag;

    }

    @Override
    public boolean checkPaymentPassword(String paymentPassword,int customerID) {
        return getCustomer(customerID).getPaymentPassword().equals(paymentPassword);
    }

    @Override
    public String getCustomerUsername(int customerID) {
        String customerUsername = "";

        ResultSet rs = null;
        Connection conn;
        PreparedStatement stmnt;

        try {

            conn = MySQLJDBCUtil.getConnection();
            stmnt = conn.prepareStatement(FIND_CUSTOMER_USERNAME);

            stmnt.setInt(1, customerID);
            rs = stmnt.executeQuery(); // Executing the sql query

            while (rs.next()) {
                customerUsername = rs.getString("userName");
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



        return customerUsername;
    }

    @Override
    public String getCustomerFullName(int customerID) {
        String customerFullName = "";

        ResultSet rs = null;
        Connection conn;
        PreparedStatement stmnt;

        try {

            conn = MySQLJDBCUtil.getConnection();
            stmnt = conn.prepareStatement(FIND_CUSTOMER_FULL_NAME);

            stmnt.setInt(1, customerID);
            rs = stmnt.executeQuery(); // Executing the sql query

            while (rs.next()) {
                customerFullName = rs.getString("firstName")+" "+rs.getString("lastName") ;
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



        return customerFullName;    }

    @Override
    public int checkExistingEmail(String email) {
        ResultSet rs = null;
        PreparedStatement stmnt = null;
        Connection conn = null;
        int customerID = -1;

        try {
            conn = MySQLJDBCUtil.getConnection();
            stmnt = conn.prepareStatement(FIND_CUSTOMER_BY_EMAIL);
            stmnt.setString(1, email);
            stmnt.setBoolean(2, false);

            rs = stmnt.executeQuery();
            if(rs.next())
                customerID = rs.getInt("customerID");
        }
        catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            try {
                if (rs != null)
                    rs.close();
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
        }

        return customerID;
    }

    public int checkExistingUsername(String username) {
        ResultSet rs = null;
        PreparedStatement stmnt = null;
        Connection conn = null;
        int customerID = -1;

        try {
            conn = MySQLJDBCUtil.getConnection();
            stmnt = conn.prepareStatement(FIND_CUSTOMER_BY_USERNAME);
            stmnt.setString(1, username);
            stmnt.setBoolean(2, false);

            rs = stmnt.executeQuery();
            if(rs.next())
                customerID = rs.getInt("customerID");
        }
        catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            try {
                if (rs != null)
                    rs.close();
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
        }

        return customerID;
    }

}

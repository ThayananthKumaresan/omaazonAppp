package com.example.omazonwebappp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class MySQLJDBCUtil {


    public static Connection getConnection() throws SQLException {
        Connection conn = null;

        try {

            // create a connection to the database
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://34.87.82.182:3306/omazon", "root", "omazon");
            //String url="jdbc:mysql://omazon.mysql.database.azure.com:3306/omazon?useSSL=true";
           // conn=DriverManager.getConnection(url, "omazon", "admin123#");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return conn;
    }

}

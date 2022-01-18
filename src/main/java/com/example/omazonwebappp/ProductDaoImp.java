package com.example.omazonwebappp;

import java.sql.*;
import java.util.ArrayList;

public class ProductDaoImp implements ProductDao {

    private static final String DELETE = "UPDATE product SET productDeletedFlag =? WHERE productID=?";
    private static final String FIND_BY_SELLER = "SELECT * FROM product WHERE productDeletedFlag=? and productSellerID=?";
    private static final String FIND_ALL = "SELECT * FROM product WHERE productDeletedFlag=? and productStockCount>0 ";
    private static final String FIND_BY_ID = "SELECT * FROM product WHERE productID=?";
    private static final String FIND_SELLER_BY_ID = "SELECT userName FROM product,seller WHERE productDeletedFlag=? and" +
            " productID=? and productSellerID =sellerID ";
    private static final String INSERT = "INSERT INTO product (productName, " +
            "productDescription, productCategory, productPrice, productStockCount, " +
            "productSalesCount,productSellerID,productDeletedFlag,productImage) VALUES (?,?,?,?,?,?,?,?,?)";
    private static final String UPDATE = "UPDATE product SET productName=?, productDescription=?, " +
            "productCategory=?, productPrice=?, productStockCount=?, productImage=? WHERE productID=?";
    private static final String UPDATE_PRODUCT_STOCK = "UPDATE product SET productStockCount=? WHERE productID=?";
    private static final String UPDATE_PRODUCT_SALES = "UPDATE product SET productSalesCount=? WHERE productID=?";


    @Override
    public Product getProduct(int productID) {
        ResultSet rs = null;
        Connection conn;
        PreparedStatement stmnt;
        Product product = new Product();

        try {

            conn = MySQLJDBCUtil.getConnection();
            stmnt = conn.prepareStatement(FIND_BY_ID);

            stmnt.setInt(1, productID);
            rs = stmnt.executeQuery(); // Executing the sql query

            while (rs.next()) {
                product.setProductID(rs.getInt("productID"));
                product.setProductName(rs.getString("productName"));
                product.setProductDescription(rs.getString("productDescription"));
                product.setProductCategory(rs.getString("productCategory"));
                product.setProductPrice(rs.getDouble("productPrice"));
                product.setProductSalesCount(rs.getInt("productSalesCount"));
                product.setProductStockCount(rs.getInt("productStockCount"));
                product.setProductSellerID(rs.getInt("productSellerID"));
                product.setProductFilePath(rs.getString("productImage"));

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

        return product;


    }

    @Override
    public String getProductSellerUsername(int productID) {

        String sellerUsername="";
        ResultSet rs = null;
        Connection conn;
        PreparedStatement stmnt;

        try {

            conn = MySQLJDBCUtil.getConnection();
            stmnt = conn.prepareStatement(FIND_SELLER_BY_ID);

            stmnt.setBoolean(1, false);
            stmnt.setInt(2, productID);
            rs = stmnt.executeQuery(); // Executing the sql query

            while (rs.next()) {
                sellerUsername =rs.getString("userName");
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


        return sellerUsername;
    }

    @Override
    public ArrayList<Product> getListOfProductsOfThisSeller(int sellerID) {

        ArrayList<Product> listOfProductOfThisSeller = new ArrayList<>();

        ResultSet rs = null;
        Connection conn;
        PreparedStatement stmnt;

        try {

            conn = MySQLJDBCUtil.getConnection();
            stmnt = conn.prepareStatement(FIND_BY_SELLER);

            stmnt.setBoolean(1, false);
            stmnt.setInt(2, sellerID);
            rs = stmnt.executeQuery(); // Executing the sql query

            while (rs.next()) {
                Product product = new Product();
                product.setProductID(rs.getInt("productID"));
                product.setProductName(rs.getString("productName"));
                product.setProductDescription(rs.getString("productDescription"));
                product.setProductCategory(rs.getString("productCategory"));
                product.setProductPrice(rs.getDouble("productPrice"));
                product.setProductSalesCount(rs.getInt("productSalesCount"));
                product.setProductStockCount(rs.getInt("productStockCount"));
                product.setProductFilePath(rs.getString("productImage"));

                listOfProductOfThisSeller.add(product);
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

        if (listOfProductOfThisSeller.size() == 0) {
            return null;
        } else {
            return listOfProductOfThisSeller;
        }

    }

    @Override
    public ArrayList<Product> getListOfAllProduct() {

        ArrayList<Product> listOfAllProduct = new ArrayList<>();

        ResultSet rs = null;
        Connection conn;
        PreparedStatement stmnt;

        try {

            conn = MySQLJDBCUtil.getConnection();
            stmnt = conn.prepareStatement(FIND_ALL);

            stmnt.setBoolean(1, false);
            rs = stmnt.executeQuery(); // Executing the sql query

            while (rs.next()) {
                Product product = new Product();
                product.setProductID(rs.getInt("productID"));
                product.setProductName(rs.getString("productName"));
                product.setProductDescription(rs.getString("productDescription"));
                product.setProductCategory(rs.getString("productCategory"));
                product.setProductPrice(rs.getDouble("productPrice"));
                product.setProductSalesCount(rs.getInt("productSalesCount"));
                product.setProductStockCount(rs.getInt("productStockCount"));
                product.setProductSellerID(rs.getInt("productSellerID"));
                product.setProductFilePath(rs.getString("productImage"));

                listOfAllProduct.add(product);
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


        return listOfAllProduct;
    }


    @Override
    public ArrayList<Product> getTop3SellingProduct() {

        ArrayList<Product> listOfAllProductInDatabase = getListOfAllProduct();

        int n = listOfAllProductInDatabase.size();
        Product tempProduct;
        for (int i = 0; i < n; i++) {
            for (int j = 1; j < (n - i); j++) {
                if (listOfAllProductInDatabase.get(j - 1).getProductSalesCount() < listOfAllProductInDatabase.get(j).getProductSalesCount()) {
                    //swap elements
                    tempProduct = listOfAllProductInDatabase.get(j - 1);
                    listOfAllProductInDatabase.set(j - 1, listOfAllProductInDatabase.get(j));
                    listOfAllProductInDatabase.set(j, tempProduct);
                }

            }
        }

        ArrayList<Product> top3SellingProducts = new ArrayList<>();

        for (int i = 0; i < 3; i++) {
            top3SellingProducts.add(listOfAllProductInDatabase.get(i));
        }

        return top3SellingProducts;
    }

    @Override
    public ArrayList<Product> getListOfProductsBasedOnCategory(String categoryName) {

        ArrayList<Product> listOfProductsBasedOnCategory = new ArrayList<>();
        ArrayList<Product> listOfAllProductInDatabase = getListOfAllProduct();

        for (int i = 0; i < listOfAllProductInDatabase.size(); i++) {
            if (listOfAllProductInDatabase.get(i).getProductCategory().equals(categoryName)) {
                listOfProductsBasedOnCategory.add(listOfAllProductInDatabase.get(i));
            }
        }

        if (listOfProductsBasedOnCategory.size() == 0) {
            return null;
        } else {
            return listOfProductsBasedOnCategory;
        }
    }


    @Override
    public void addProduct(Product product) {

        ResultSet rs = null;
        Connection conn;
        PreparedStatement stmnt;

        try {

            conn = MySQLJDBCUtil.getConnection();
            stmnt = conn.prepareStatement(INSERT, Statement.RETURN_GENERATED_KEYS);

            stmnt.setString(1, product.getProductName());
            stmnt.setString(2, product.getProductDescription());
            stmnt.setString(3, product.getProductCategory());
            stmnt.setDouble(4, product.getProductPrice());
            stmnt.setInt(5, product.getProductStockCount());
            stmnt.setInt(6, product.getProductSalesCount());
            stmnt.setInt(7, product.getProductSellerID());
            stmnt.setBoolean(8, false);
            stmnt.setString(9, product.getProductFilePath());

            stmnt.executeUpdate(); // Executing the sql query

            rs = stmnt.getGeneratedKeys();

            if (rs.next()) {
                product.setProductID(rs.getInt(1)); //Setting the product ID

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
    public void updateProduct(Product product) {

        PreparedStatement stmnt = null;
        Connection conn = null;

        try {
            conn = MySQLJDBCUtil.getConnection();
            stmnt = conn.prepareStatement(UPDATE);
            stmnt.setString(1, product.getProductName());
            stmnt.setString(2, product.getProductDescription());
            stmnt.setString(3, product.getProductCategory());
            stmnt.setDouble(4, product.getProductPrice());
            stmnt.setInt(5, product.getProductStockCount());
            stmnt.setString(6, product.getProductFilePath());
            stmnt.setInt(7, product.getProductID());
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
    public void deleteProduct(Product product) {

        PreparedStatement stmnt = null;
        Connection conn = null;

        try {
            conn = MySQLJDBCUtil.getConnection();
            stmnt = conn.prepareStatement(DELETE);
            stmnt.setBoolean(1, true);
            stmnt.setInt(2, product.getProductID());

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
    public void reduceProductStock(Product product, int stockCountToReduce) {

        PreparedStatement stmnt = null;
        Connection conn = null;

        try {
            conn = MySQLJDBCUtil.getConnection();
            stmnt = conn.prepareStatement(UPDATE_PRODUCT_STOCK);
            stmnt.setInt(1, product.getProductStockCount()- stockCountToReduce);
            stmnt.setInt(2, product.getProductID());

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
    public void addProductSalesCount(Product product, int salesCountToAdd) {

        PreparedStatement stmnt = null;
        Connection conn = null;

        try {
            conn = MySQLJDBCUtil.getConnection();
            stmnt = conn.prepareStatement(UPDATE_PRODUCT_SALES);
            stmnt.setInt(1, product.getProductSalesCount() + salesCountToAdd);
            stmnt.setInt(2, product.getProductID());

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


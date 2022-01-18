package com.example.omazonwebappp;

public class Product {

    private int productID;
    private String productName;
    private String productDescription;
    private String productCategory;
    private double productPrice;
    private int productStockCount;
    private int productSalesCount;
    private int productSellerID;
    private String productFilePath;

    /**
     * Empty Constructor
     */
    public Product() {}

    /**
     * Overloaded constructor with 4 parameter
     * @param productID
     * @param productName
     * @param productDescription
     * @param productPrice
     */
    public Product(int productID,String productName, String productDescription, double productPrice) {
        this.productID = productID;
        this.productName = productName;
        this.productDescription = productDescription;
        this.productPrice = productPrice;
    }

    /**
     * Overloaded constructor with 9 parameter
     * @param productSellerID
     * @param productID
     * @param productName
     * @param productDescription
     * @param productCategory
     * @param productPrice
     * @param productStockCount
     * @param productSalesCount
     * @param productFilePath
     */
    public Product(int productSellerID, int productID,String productName, String productDescription, String productCategory ,double productPrice, int productStockCount, int productSalesCount , String productFilePath) {
        this.productID = productID;
        this.productName = productName;
        this.productDescription = productDescription;
        this.productPrice = productPrice;
        this.productStockCount = productStockCount;
        this.productSalesCount = productSalesCount;
        this.productCategory = productCategory;
        this.productSellerID = productSellerID;
        this.productFilePath = productFilePath;
    }

    /**
     * Accessor method for all attribute
     */
    public int getProductID() {
        return productID;
    }
    public String getProductName() {
        return productName;
    }
    public String getProductDescription() {
        return productDescription;
    }
    public String getProductCategory() {
        return productCategory;
    }
    public double getProductPrice() {
        return productPrice;
    }
    public int getProductStockCount() {
        return productStockCount;
    }
    public int getProductSalesCount() {
        return productSalesCount;
    }
    public int getProductSellerID() {
        return productSellerID;
    }
    public String getProductFilePath() {
        return productFilePath;
    }

    /**
     * Mutator method for all attribute
     */
    public void setProductID(int productID) {
        this.productID = productID;
    }
    public void setProductName(String productName) {
        this.productName = productName;
    }
    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
    }
    public void setProductCategory(String productCategory) {
        this.productCategory = productCategory;
    }
    public void setProductPrice(double productPrice) {
        this.productPrice = productPrice;
    }
    public void setProductStockCount(int productStockCount) {
        this.productStockCount = productStockCount;
    }
    public void setProductSalesCount(int productSalesCount) {
        this.productSalesCount = productSalesCount;
    }
    public void setProductSellerID(int productSellerID) {
        this.productSellerID = productSellerID;
    }
    public void setProductFilePath(String productFilePath) {
        this.productFilePath = productFilePath;
    }
}



package com.example.omazonwebappp;

import java.text.DecimalFormat;
import java.util.Scanner;

public class DAOObjects {

    public static Customer sessionCustomer = new Customer();
    public static Seller sessionSeller = new Seller();
    public static Scanner input = new Scanner(System.in);
    public static CartDao cartDAO = new CartDaoImp();
    public static ProductDao productDAO = new ProductDaoImp();
    public static WalletDao walletDAO = new WalletDaoImp();
    public static OrdersDao ordersDAO = new OrdersDaoImp();
    public static TransactionDao transactionDAO = new TransactionDaoImp();
    public static CustomerDao customerDAO = new CustomerDaoImp();
    public static SellerDao sellerDAO = new SellerDaoImp();
    public static NotificationDao notificationDAO = new NotificationDaoImp();
    public static FeedbackDao feedbackDAO = new FeedbackDaoImp();
    public static FavoritesDao favoriteDAO = new FavoritesDaoImp();
    public static DecimalFormat df = new DecimalFormat("0.00");


}

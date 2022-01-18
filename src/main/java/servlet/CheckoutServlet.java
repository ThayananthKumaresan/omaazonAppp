package servlet;

import com.example.omazonwebappp.*;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import static com.example.omazonwebappp.DAOObjects.*;

@WebServlet(name = "CheckoutServlet", value = "/CheckoutServlet")
public class CheckoutServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

         PrintWriter out = response.getWriter();

         // Get all the values
        String paymentPassword = request.getParameter("paymentPassword");
        double totalCheckoutAmount = Double.parseDouble(request.getParameter("totalCheckoutAmount"));

        LocalDateTime myDateObj = LocalDateTime.now();
        DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("E, MMM dd yyyy");
        String formattedDate = myDateObj.format(myFormatObj);
        ArrayList<Cart> listOfCartOfThisCustomer = cartDAO.getListOfCartOfThisCustomer(sessionCustomer.getCustomerID());

        // if password is wrong then ...
        if (!customerDAO.checkPaymentPassword(paymentPassword,sessionCustomer.getCustomerID())) {
            out.println("wrongPasswordFlag");
        }else if(customerDAO.getCustomer(sessionCustomer.getCustomerID()).getUserWallet().getWalletBalance() <totalCheckoutAmount){
            out.println("lowBalanceFlag");
        }else{
            // Add Orders
            //Increase Sales Count of this product
            //Reduce Stock Count of this product
            //Removing from user's cart
            // Notify the seller
            // Add transaction for seller

            long millis=System.currentTimeMillis();
            listOfCartOfThisCustomer.forEach(cart -> {

                Product productsInCartForOrders = productDAO.getProduct(cart.getCartProductID());
                Orders order = new Orders(
                        "Unprocessed",
                        formattedDate,
                        sessionCustomer.getCustomerID(),
                        false,
                        "Track Not Set",
                        false,
                        productsInCartForOrders.getProductSellerID(),
                        productsInCartForOrders.getProductID(),
                        cart.getCartQuantity()
                );
                ordersDAO.addOrders(order);
                productDAO.reduceProductStock(productsInCartForOrders, cart.getCartQuantity());
                productDAO.addProductSalesCount(productsInCartForOrders, cart.getCartQuantity());
                cartDAO.deleteCart(cart.getCartID());
                Notification notificationSeller = new Notification(productsInCartForOrders.getProductSellerID(), order.getOrderID(), sessionCustomer.getCustomerID(), productsInCartForOrders.getProductID());
                notificationDAO.addNotification(notificationSeller);
                Transaction transaction = new Transaction(
                        productsInCartForOrders.getProductPrice() * cart.getCartQuantity(),
                        formattedDate,
                        productsInCartForOrders.getProductSellerID(),new Date(millis));
                transactionDAO.addTransaction(transaction);
                sellerDAO.updateSellerProfit(productsInCartForOrders.getProductSellerID(), productsInCartForOrders.getProductPrice() * cart.getCartQuantity());

            });

            //Reduce Wallet Balance
            walletDAO.reduceWalletBalance(sessionCustomer.getUserWallet(), totalCheckoutAmount);

            // Add transaction for customer
            Transaction transaction = new Transaction(
                    totalCheckoutAmount,
                    formattedDate,
                    sessionCustomer.getCustomerID(),
                    new Date(millis)
            );

            transactionDAO.addTransaction(transaction);
            out.println("successful");

        }

    }
}

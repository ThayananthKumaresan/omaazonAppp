package servlet;

import com.example.omazonwebappp.Feedback;
import com.example.omazonwebappp.Orders;
import com.example.omazonwebappp.OrdersDao;
import com.example.omazonwebappp.OrdersDaoImp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

import static com.example.omazonwebappp.DAOObjects.*;

@WebServlet(name = "OrderServlet", value = "/OrderServlet")
public class OrderServlet extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //Get order ID from request
        //Create a new order object
        int ordersID =Integer.parseInt(request.getParameter("ordersID"));
        Orders order = ordersDAO.getOrders(ordersID);

        //If type of requst is "null"
        if( request.getParameter("type") == null) {
            //set the order tracking id and status
            //update order in database
            order.setOrderTrackingID(request.getParameter("orderTrackingID"));
            order.setOrderStatus(request.getParameter("oderStatus"));
            ordersDAO.updateOrders(order);

            response.sendRedirect("Seller_Orders.jsp?successfulOrderUpdateFlag=successfulOrderUpdate");
        }else{
            //set order status as "delivered"
            //update order in database
            order.setOrderStatus("Delivered");
            order.setOrderReceivedOrNot(true);
            ordersDAO.updateOrders(order);

            //get product feedback and rating
            String productFeedback = request.getParameter("productFeedback");
            int productRating = Integer.parseInt(request.getParameter("productRating"));
            System.out.println(productRating);
            Feedback feedbackProduct = new Feedback(
                    productDAO.getProduct(order.getOrderProductID()).getProductID(),
                    productFeedback,
                    "None",
                    sessionCustomer.getCustomerID(),
                    productRating);

            //create new feedback obeject and add it into databse
            feedbackDAO.addFeedback(feedbackProduct);

            response.sendRedirect("Customer_Order_History.jsp?successfulOrderConfirmationFlag=successfulOrderConfirmation");

        }

    }
}

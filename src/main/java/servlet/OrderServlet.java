package servlet;

import com.example.omazonwebappp.Feedback;
import com.example.omazonwebappp.Orders;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import java.io.IOException;

import static com.example.omazonwebappp.DAOObjects.*;

@WebServlet(name = "OrderServlet", value = "/OrderServlet")
public class OrderServlet extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int ordersID =Integer.parseInt(request.getParameter("ordersID"));
        Orders order = ordersDAO.getOrders(ordersID);

        if( request.getParameter("type") == null) {
            order.setOrderTrackingID(request.getParameter("orderTrackingID"));
            order.setOrderStatus(request.getParameter("oderStatus"));
            ordersDAO.updateOrders(order);

            response.sendRedirect("Seller_Orders.jsp?successfulOrderUpdateFlag=successfulOrderUpdate");
        }else{

            order.setOrderStatus("Delivered");
            order.setOrderReceivedOrNot(true);
            ordersDAO.updateOrders(order);

            String productFeedback = request.getParameter("productFeedback");
            int productRating = Integer.parseInt(request.getParameter("productRating"));
                System.out.println(productRating);
            Feedback feedbackProduct = new Feedback(
                    productDAO.getProduct(order.getOrderProductID()).getProductID(),
                    productFeedback,
                    "None",
                    sessionCustomer.getCustomerID(),
                    productRating);

            feedbackDAO.addFeedback(feedbackProduct);

            response.sendRedirect("Customer_Order_History.jsp?successfulOrderConfirmationFlag=successfulOrderConfirmation");

        }

    }
}

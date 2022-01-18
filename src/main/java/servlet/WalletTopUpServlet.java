package servlet;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import java.io.IOException;

import static com.example.omazonwebappp.DAOObjects.*;

@WebServlet(name = "WalletTopUpServlet", value = "/WalletTopUpServlet")
@MultipartConfig

public class WalletTopUpServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        String topUpAmount  = request.getParameter("topUpAmount");
        walletDAO.topUpWalletBalance(customerDAO.getCustomer(sessionCustomer.getCustomerID()).getUserWallet(), Double.parseDouble(topUpAmount));

        response.sendRedirect("Customer_Profile.jsp?successfulTopUpFlag=successfulTopUp");
    }
}

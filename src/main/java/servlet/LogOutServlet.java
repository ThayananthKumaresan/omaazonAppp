package servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

import static com.example.omazonwebappp.DAOObjects.*;

@WebServlet(name = "LogOutServlet", value = "/LogOutServlet")
public class LogOutServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if(sessionCustomer.getCustomerID()!=0)
            sessionCustomer.setCustomerID(0);
        else if (sessionSeller.getSellerID()!=0 ){
            sessionSeller.setSellerID(0);
        }

    }
}

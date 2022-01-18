package servlet;

import com.example.omazonwebappp.*;

import javax.servlet.annotation.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

import static com.example.omazonwebappp.DAOObjects.*;


@WebServlet(name = "LoginServlet", value = "/LoginServlet")

public class LoginServlet extends HttpServlet {


    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        PrintWriter out = response.getWriter();
        String userRole  = request.getParameter("userRole");

        if(userRole.equals("customer")) {
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            Customer loginCustomer = new Customer(email, password);

            if (customerDAO.loginCustomer(loginCustomer)) {
                HttpSession session = request.getSession();
                session.setAttribute("customerID", sessionCustomer.getCustomerID());
                out.println("successful");

            } else {
                HttpSession session = request.getSession();
                Customer msg = null;
                session.setAttribute("msg", msg);
                out.println("unsuccessful");
            }
        }else{

            String email  = request.getParameter("email");
            String password  = request.getParameter("password");

            Seller loginSeller = new Seller(email, password);

            System.out.println("email "+email);
            System.out.println("password "+password);

            if( sellerDAO.loginSeller(loginSeller) ){
                HttpSession session = request.getSession();
                session.setAttribute("loginSellerID",loginSeller.getSellerID());

                out.println("successful");

            }else{
                HttpSession session = request.getSession();
                Customer msg = null;
                session.setAttribute("msg",msg);
                out.println("unsuccessful");
            }
        }
    }

}
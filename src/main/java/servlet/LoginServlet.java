package servlet;

import com.example.omazonwebappp.*;

import java.io.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

import static com.example.omazonwebappp.DAOObjects.*;


@WebServlet(name = "LoginServlet", value = "/LoginServlet")

public class LoginServlet extends HttpServlet {


    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        //Get the user role from request
        PrintWriter out = response.getWriter();
        String userRole  = request.getParameter("userRole");

        if(userRole.equals("customer")) {
            //Get email and password from request
            //Create a new customer object using the parameter
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            Customer loginCustomer = new Customer(email, password);

            //set session customer to the customer that found
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
            //Get email and password from request
            //Create a new seller object using the parameter
            String email  = request.getParameter("email");
            String password  = request.getParameter("password");

            Seller loginSeller = new Seller(email, password);

            System.out.println("email "+email);
            System.out.println("password "+password);

            if( sellerDAO.loginSeller(loginSeller) ){
                HttpSession session = request.getSession();
                //set session seller to the seller that found
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

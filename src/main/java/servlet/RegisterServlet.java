package servlet;

import com.example.omazonwebappp.*;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

import static com.example.omazonwebappp.DAOObjects.*;

@WebServlet(name = "RegisterServlet", value = "/RegisterServlet")
@MultipartConfig

public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        PrintWriter out = response.getWriter();
        String role  = request.getParameter("role");

        if(role.equals("customer")) {
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String username = request.getParameter("username");
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String paymentPassword = request.getParameter("paymentPassword");
            String address = request.getParameter("address");
            String contactNum = request.getParameter("contactNum");

            if (customerDAO.checkExistingEmail(email) > 0) {
                out.println("usedEmailFlag");
            } else if (customerDAO.checkExistingUsername(username) > 0) {
                out.println("usedUsernameFlag");
            } else {
                Customer registerCustomer = new Customer(email, password, username, firstName, lastName, paymentPassword, address, contactNum);
                customerDAO.registerCustomer(registerCustomer);
                out.println("successful");
            }
        }else{


            String sellerIC = request.getParameter("sellerIC");
            String sellerAddress = request.getParameter("sellerAddress");
            String sellerShopName = request.getParameter("sellerShopName");
            String sellerBusinessRegNum = request.getParameter("sellerBusinessRegNum");
            String sellerBankAcc = request.getParameter("sellerBankAcc");

            Customer customer = customerDAO.getCustomer(sessionCustomer.getCustomerID());

            Seller registerSeller = new Seller(customer.getEmail(),customer.getPassword(),
                    customer.getUserName(),customer.getFirstName(),customer.getLastName(),
                    sellerBankAcc,sellerAddress,sellerIC,sellerBusinessRegNum,sellerShopName,customer.getContactNum());

            sellerDAO.registerSeller(registerSeller);
            customerDAO.updateCustomerAsSeller(customer);

        }

    }
}

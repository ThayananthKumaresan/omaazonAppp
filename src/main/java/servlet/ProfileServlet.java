package servlet;

import com.example.omazonwebappp.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.*;
import java.util.Objects;

import static com.example.omazonwebappp.DAOObjects.*;

@MultipartConfig
@WebServlet(name = "ProfileServlet", value = "/ProfileServlet")
public class ProfileServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        PrintWriter out = response.getWriter();
        String userRole = request.getParameter("userRole");
        String type = request.getParameter("type");

        if (Objects.equals(userRole, "customer")){

            if(type.equals("profile")) {
                String email = request.getParameter("email");
                String userName = request.getParameter("userName");
                String firstName = request.getParameter("firstName");
                String lastName = request.getParameter("lastName");
                String contactNum = request.getParameter("contactNum");
                String address = request.getParameter("address");

                    Customer customer = customerDAO.getCustomer(sessionCustomer.getCustomerID());
                    customer.setUserName(userName);
                    customer.setEmail(email);
                    customer.setAddress(address);
                    customer.setFirstName(firstName);
                    customer.setLastName(lastName);
                    customer.setContactNum(contactNum);
                    customerDAO.updateCustomerProfile(customer);

                    Seller seller= new Seller();
                    seller.setUserName(userName);
                    seller.setEmail(email);
                    seller.setFirstName(firstName);
                    seller.setLastName(lastName);
                    seller.setPassword(customer.getPassword());
                sellerDAO.updateSellerMainProfile(seller,customer.getCustomerID());
                    out.println("successful");


            }
            else  if(type.equals("password")) {
                String paymentPassword = request.getParameter("paymentPassword");
                String password = request.getParameter("password");

                Customer customer = customerDAO.getCustomer(sessionCustomer.getCustomerID());
                customer.setPaymentPassword(paymentPassword);
                customer.setPassword(password);

                customerDAO.updateCustomerPassword(customer);

                Seller seller= new Seller();
                seller.setUserName(customer.getUserName());
                seller.setEmail(customer.getEmail());
                seller.setFirstName(customer.getFirstName());
                seller.setLastName(customer.getLastName());
                seller.setPassword(password);
                sellerDAO.updateSellerMainProfile(seller,customer.getCustomerID());


                out.println("successful");

            }
            else if(type.equals("profileImage")){
                Part part = request.getPart("profileImage");
                String imageName = part.getSubmittedFileName();

                Customer customer = customerDAO.getCustomer(sessionCustomer.getCustomerID());
                customer.setProfileImage(imageName);
                customerDAO.updateCustomerProfileImage(customer);

                InputStream is =part.getInputStream();

                try {
                    byte[] b = new byte[is.available()];

                    part.getInputStream().read(b);
                    String path = request.getRealPath("/") + "pics" + File.separator + imageName;

                    FileOutputStream fos = new FileOutputStream(path);
                    fos.write(b);
                    fos.flush();
                    fos.close();
                    out.println("successful");

                } catch (IOException e) {
                    e.printStackTrace();
                }
            }else{
                customerDAO.deleteCustomer(sessionCustomer);
            }

        }else{
            if(type.equals("sellerProfileImage")){
                Part part = request.getPart("sellerProfileImage");
                String imageName = part.getSubmittedFileName();

                Seller seller = new Seller();
                seller.setSellerID(sessionSeller.getSellerID());
                seller.setSellerShopImage(imageName);
                sellerDAO.updateSellerShopImage(seller);

                InputStream is =part.getInputStream();

                try {
                    byte[] b = new byte[is.available()];

                    part.getInputStream().read(b);
                    String path = request.getRealPath("/") + "pics" + File.separator + imageName;

                    FileOutputStream fos = new FileOutputStream(path);
                    fos.write(b);
                    fos.flush();
                    fos.close();

                } catch (IOException e) {
                    e.printStackTrace();
                }
                response.sendRedirect("Seller_Profile.jsp?successfulProfileUpdateFlag=successfulProfileUpdate");

            }else {
                String shopName = request.getParameter("shopName");
                String sellerPhoneNumber = request.getParameter("sellerPhoneNumber");
                String sellerAddress = request.getParameter("sellerAddress");
                String sellerBusinessRegistrationNumber = request.getParameter("sellerBusinessRegistrationNumber");
                String sellerBankAccount = request.getParameter("sellerBankAccount");
                String sellerIC = request.getParameter("sellerIC");


                Seller seller = new Seller();
                seller.setSellerID(sessionSeller.getSellerID());
                seller.setSellerIC(sellerIC);
                seller.setSellerShopName(shopName);
                seller.setSellerShopAddress(sellerAddress);
                seller.setSellerPhoneNumber(sellerPhoneNumber);
                seller.setSellerBusinessRegistrationNumber(sellerBusinessRegistrationNumber);
                seller.setSellerBankAccount(sellerBankAccount);

                sellerDAO.updateSeller(seller);

                response.sendRedirect("Seller_Profile.jsp?successfulProfileUpdateFlag=successfulProfileUpdate");
            }
        }

    }
}

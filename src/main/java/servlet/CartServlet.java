package servlet;

import com.example.omazonwebappp.Cart;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Objects;

import static com.example.omazonwebappp.DAOObjects.cartDAO;

@MultipartConfig

@WebServlet(name = "CartServlet", value = "/CartServlet")
public class CartServlet extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        PrintWriter out = response.getWriter();

        //If mode of request equal to "add"
        if (Objects.equals(request.getParameter("mode"), "add")) {
            //Get the product ID, quantity, customer ID
            int productID = Integer.parseInt(request.getParameter("productIDForCart"));
            int cartQuantity = Integer.parseInt(request.getParameter("cartQuantity"));
            int customerID = Integer.parseInt(request.getParameter("customerID"));

            //Create a new Cart object with the parameter
            //Add the object into database
            Cart addToCart = new Cart(productID, cartQuantity, customerID);
            cartDAO.addCart(addToCart);

            out.println("succesfull");
        }else if (Objects.equals(request.getParameter("mode"), "delete")){
            //If mode of request equal to "delete"
            //Delete cart object with the cart ID from database
            int cartID = Integer.parseInt(request.getParameter("cartIDToDeleteFromCart"));
            cartDAO.deleteCart(cartID);
        }else{
            //Get the product ID, quantity
            //Update cart quantity of Cart object with cart ID in database
            int cartID = Integer.parseInt(request.getParameter("cartID"));
            int cartQuantity = Integer.parseInt(request.getParameter("cartQuantity"));
            cartDAO.updateCart(cartID,cartQuantity);

            response.sendRedirect("Customer_Cart.jsp");


        }

    }
}

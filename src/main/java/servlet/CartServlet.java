package servlet;

import com.example.omazonwebappp.Cart;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
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

        if (Objects.equals(request.getParameter("mode"), "add")) {
            int productID = Integer.parseInt(request.getParameter("productIDForCart"));
            int cartQuantity = Integer.parseInt(request.getParameter("cartQuantity"));
            int customerID = Integer.parseInt(request.getParameter("customerID"));

            Cart addToCart = new Cart(productID, cartQuantity, customerID);
            cartDAO.addCart(addToCart);

            out.println("succesfull");
        }else if (Objects.equals(request.getParameter("mode"), "delete")){
            int cartID = Integer.parseInt(request.getParameter("cartIDToDeleteFromCart"));
            cartDAO.deleteCart(cartID);
        }else{
            int cartID = Integer.parseInt(request.getParameter("cartID"));
            int cartQuantity = Integer.parseInt(request.getParameter("cartQuantity"));
            cartDAO.updateCart(cartID,cartQuantity);

            response.sendRedirect("Customer_Cart.jsp");


        }

    }
}

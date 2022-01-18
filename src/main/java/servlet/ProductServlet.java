package servlet;

import com.example.omazonwebappp.Product;
import com.example.omazonwebappp.ProductDao;
import com.example.omazonwebappp.ProductDaoImp;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.util.Objects;

import static com.example.omazonwebappp.DAOObjects.productDAO;
import static com.example.omazonwebappp.DAOObjects.sessionSeller;

@MultipartConfig
@WebServlet(name = "ProductServlet", value = "/ProductServlet")
public class ProductServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        PrintWriter out = response.getWriter();

        //If mode of request is "add"
        if (Objects.equals(request.getParameter("mode"), "add")) {
            //get the details of product
            String productName = request.getParameter("productName");
            String productCategory = request.getParameter("productCategory");
            String productDescription = request.getParameter("productDescription");
            double productPrice = Double.parseDouble(request.getParameter("productPrice"));
            int productStock = Integer.parseInt(request.getParameter("productStock"));

            Part part = request.getPart("productImage");
            String imageName = part.getSubmittedFileName();

            //create new product object
            //add the product object into database
            productDAO.addProduct(new Product(sessionSeller.getSellerID(), 0, productName, productDescription, productCategory,
                    productPrice, productStock, 0, imageName));

            InputStream is =part.getInputStream();

            try {
                byte[] b = new byte[is.available()];

                part.getInputStream().read(b);
                String path = request.getRealPath("/") + "pics" + File.separator + imageName;
                out.println("path " + path);

                FileOutputStream fos = new FileOutputStream(path);
                fos.write(b);
                fos.flush();
                fos.close();

                out.println("successful");
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else if (Objects.equals(request.getParameter("mode"), "edit")){
            //If mode of request is "edit"
            //get the details of product
            String productName = request.getParameter("productName");
            String productCategory = request.getParameter("productCategory");
            String productDescription = request.getParameter("productDescription");
            double productPrice = Double.parseDouble(request.getParameter("productPrice"));
            int productStock = Integer.parseInt(request.getParameter("productStock"));

            Part part = request.getPart("productImage");
            String imageName = part.getSubmittedFileName();

            if(imageName== "" ){
                imageName = request.getParameter("currentProductImage");
            }

            //create new product object
            //update the product object into database
            productDAO.updateProduct(new Product(sessionSeller.getSellerID(), Integer.parseInt(request.getParameter("productID")), productName, productDescription, productCategory,
                    productPrice, productStock, 0, imageName));

            InputStream is =part.getInputStream();

            try {
                byte[] b = new byte[is.available()];

                part.getInputStream().read(b);
                String path = request.getRealPath("/") + "pics" + File.separator + imageName;
                System.out.println("path " + path);

                FileOutputStream fos = new FileOutputStream(path);
                fos.write(b);
                fos.close();

                out.println("successful");
            } catch (IOException e) {
                e.printStackTrace();
            }


        }else{
            //create new product object
            //delete the product object in database
            Product product = productDAO.getProduct(Integer.parseInt(request.getParameter("productIDToDelete")));
            productDAO.deleteProduct(product);

        }


    }
}

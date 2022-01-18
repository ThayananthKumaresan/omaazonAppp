<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.omazonwebappp.Product" %>
<%if(sessionCustomer.getCustomerID()==0){response.sendRedirect("index.jsp");}%>
<%@ page import="static com.example.omazonwebappp.DAOObjects.productDAO" %>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Login | Omazon</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/prettyPhoto.css" rel="stylesheet">
    <link href="css/price-range.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/main.css" rel="stylesheet">
    <link href="css/responsive.css" rel="stylesheet">
    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
</head><!--/head-->

<body>

<%@ include file="header.jsp"  %>


<section>
    <div class="container">
        <div class="row">
            <div class="col-sm-3">
                <div class="left-sidebar">
                    <h2>Category</h2>

                    <div class="panel-group category-products" id="accordian"><!--category-productsr-->

                        <%
                            String[] category = new String[]{"Women Clothes", "Men Clothes", "Health & Beauty", "Mobile & Accessories",
                                    "Baby & Toys", "Watches", "Home & Living", "Home Appliances", "Women's Bags", "Men's Bags & Wallets",
                                    "Muslim Fashion", "Computer & Accessories", "Groceries & Pets", "Sport & Outdoor", "Women Shoes",
                                    "Men Shoes", "Fashion Accessories", "Games, Books & Hobbies", "Automotive", "Tickets & Vouchers"};

                            for (int i = 0; i < category.length; i++) {

                        %>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title"><a href="Customer_Shop.jsp?category=<%=category[i]%>"><%=category[i]%></a></h4>
                            </div>
                        </div>

                        <%

                            }
                        %>


                    </div><!--/category-productsr-->

                </div>
            </div>

            <div class="col-sm-9 padding-right">
                <div class="features_items"><!--features_items-->
                    <h2 class="title text-center">Your search result by product</h2>
                    <%

                        String term = request.getParameter("term");
                        //result of searching similar term
                        ArrayList<Product> searchResult = new ArrayList<>();
                        ArrayList<Product> listOfAllProducts = productDAO.getListOfAllProduct();

                        for (int i = 0; i < listOfAllProducts.size(); i++) {
                            Product temp = listOfAllProducts.get(i);
                            //check does name of product contain term or term contain name of product
                            if (temp.getProductName().toLowerCase().contains(term.toLowerCase()) || term.toLowerCase().contains(temp.getProductName().toLowerCase()))
                                searchResult.add(temp);  //if true,add product into arrayList searchResult
                        }

                        if(searchResult.size()!=0)
                        {
                            for (int i = 0; i < searchResult.size(); i++){
                                Product product = searchResult.get(i);

                    %>

                    <div class="col-sm-4" id="<%=product.getProductID()%>">
                        <div class="product-image-wrapper">
                            <div class="single-products">
                                <div class="productinfo text-center">
                                    <img src="pics/<%=product.getProductFilePath()%>" alt=""  />
                                    <h2>RM <%=product.getProductPrice()%></h2>
                                    <p><%=product.getProductName()%></p>
                                </div>

                            </div>
                            <div class="choose">
                                <ul class="nav nav-pills nav-justified">
                                    <li><a href=""><i class="fa fa-plus-square"></i>Add to Wishlist</a></li>
                                    <li><a href="Customer_Product_Display.jsp?productIDToDisplay=<%=product.getProductID()%>"><i class="fa fa-plus-square"></i>More Details</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <%}
                        searchResult.clear();


                    }
                    else{

                    %>
                    <div class="col-sm-4" >
                        <div class="product-image-wrapper">
                            <div class="single-products">
                                <div class="productinfo text-center">
                                    <img src="pics/noProductFound.png" alt=""  />
                                </div>
                            </div>
                        </div>
                    </div>
                    <%
                        }
                    %>

                </div><!--features_items-->


            </div>
            <div class="col-sm-9 padding-right">
                <div class="features_items"><!--features_items-->
                    <h2 class="title text-center">Your search result by seller</h2>
                    <%


                        for (int i = 0; i < listOfAllProducts.size(); i++) {
                            Product temp = listOfAllProducts.get(i);
                            //check does name of product contain term or term contain name of product
                            if (productDAO.getProductSellerUsername(temp.getProductID()).contains(term) || term.contains(productDAO.getProductSellerUsername(temp.getProductID())))
                                searchResult.add(temp);
                        }

                        if(searchResult.size()!=0)
                        {
                            for (int i = 0; i < searchResult.size(); i++){
                                Product product = searchResult.get(i);

                    %>

                    <div class="col-sm-4" id="<%=product.getProductID()%>">
                        <div class="product-image-wrapper">
                            <div class="single-products">
                                <div class="productinfo text-center">
                                    <img src="pics/<%=product.getProductFilePath()%>" alt=""  />
                                    <h2>RM <%=product.getProductPrice()%></h2>
                                    <p><%=product.getProductName()%></p>
                                </div>

                            </div>
                            <div class="choose">
                                <ul class="nav nav-pills nav-justified">
                                    <li><a href=""><i class="fa fa-plus-square"></i>Add to Wishlist</a></li>
                                    <li><a href="Customer_Product_Display.jsp?productIDToDisplay=<%=product.getProductID()%>"><i class="fa fa-plus-square"></i>More Details</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <%}
                        searchResult.clear();

                    }
                    else{

                    %>

                    <div class="col-sm-4" >
                        <div class="product-image-wrapper">
                            <div class="single-products">
                                <div class="productinfo text-center">
                                    <img src="pics/noProductFound.png" alt=""  />
                                </div>
                            </div>
                        </div>
                    </div>

                    <%
                        }


                    %>


                </div><!--features_items-->


            </div>

        </div>
    </div>
</section>







<%@ include file="footer.jsp"  %>


<script src="js/jquery.js"></script>
<script src="js/price-range.js"></script>
<script src="js/jquery.scrollUp.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.prettyPhoto.js"></script>
<script src="js/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>



</body>
</html>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.omazonwebappp.*" %>
<%@ page import="static com.example.omazonwebappp.DAOObjects.df" %>
<%@ page import="static com.example.omazonwebappp.DAOObjects.sessionCustomer" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    request.setAttribute("productIDForWishlist",request.getParameter("productIDForWishlist"));
    request.setAttribute("mode",request.getParameter("mode"));

    String productIDForWishlist = (String) request.getAttribute("productIDForWishlist");
    String mode = (String) request.getAttribute("mode");
    FavoritesDao favoriteDAO = new FavoritesDaoImp();
    boolean existProductInFavoritesFlag = false;

    if(productIDForWishlist!=null &&  mode.equals("add")){
        int formattedProductIDForWishlist = Integer.parseInt(productIDForWishlist);
        ArrayList<Favorites> listOfFavoritesOfThisCustomer=  favoriteDAO.getListOfFavorites(sessionCustomer.getCustomerID());

        if( listOfFavoritesOfThisCustomer != null) {
            for (int i = 0; i < listOfFavoritesOfThisCustomer.size(); i++) {
                if (listOfFavoritesOfThisCustomer.get(i).getFavoritesProductID() == formattedProductIDForWishlist) {
                    existProductInFavoritesFlag = true;
                }

            }
        }

        if(!existProductInFavoritesFlag ) {
            Favorites addToFavorites = new Favorites(Integer.parseInt(productIDForWishlist), sessionCustomer.getCustomerID());
            favoriteDAO.addFavorites(addToFavorites);
            request.setAttribute("productIDForWishlist",null);
        }
    }


    if(productIDForWishlist!=null &&  mode.equals("delete")){
        int formattedProductIDForWishlist = Integer.parseInt(productIDForWishlist);
        favoriteDAO.deleteFavorites(formattedProductIDForWishlist);

    }


%>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Wishlist</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/prettyPhoto.css" rel="stylesheet">
    <link href="css/price-range.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/main.css" rel="stylesheet">
    <link href="css/responsive.css" rel="stylesheet">

    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png"></head>

</head>
<body>
<%@ include file="header.jsp"  %>


<section>
    <div class="container">
        <div class="breadcrumbs">
            <ol class="breadcrumb">
                <li><a href="#">Home</a></li>
                <li class="active">Wishlist</li>
            </ol>
        </div>
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
                                <h4 class="panel-title"><a href="Customer_Shop.jsp?category=<%=i%>"><%=category[i]%></a></h4>
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
                    <%

                        ProductDao productDAO = new ProductDaoImp();
                        ArrayList<Favorites> listOfFavorites = favoriteDAO.getListOfFavorites(sessionCustomer.getCustomerID());

                        if (listOfFavorites != null) {
                            System.out.println("listOfFavorites.size() : "+listOfFavorites.size());

                            for (int i = 0; i < listOfFavorites.size(); i++) {

                                Favorites favorite = listOfFavorites.get(i);
                    %>

                    <div class="col-sm-4" id="<%=productDAO.getProduct(favorite.getFavoritesProductID()).getProductID()%>">
                        <div class="product-image-wrapper">
                            <div class="single-products">
                                <div class="productinfo text-center">
                                    <img src="pics/<%=productDAO.getProduct(favorite.getFavoritesProductID()).getProductFilePath()%>" alt=""  />
                                    <h2>RM <%=df.format(productDAO.getProduct(favorite.getFavoritesProductID()).getProductPrice())%></h2>
                                    <p><%=productDAO.getProduct(favorite.getFavoritesProductID()).getProductName()%></p>
                                </div>

                            </div>
                            <div class="choose">
                                <ul class="nav nav-pills nav-justified">
                                    <li><a href="Customer_Wishlist.jsp?productIDForWishlist=<%=productDAO.getProduct(favorite.getFavoritesProductID()).getProductID()%>&mode=delete"><i class="fa fa-minus-square"></i>Remove from Wishlist</a></li>
                                    <li><a href="Customer_Product_Display.jsp?productIDToDisplay=<%=productDAO.getProduct(favorite.getFavoritesProductID()).getProductID()%>"><i class="fa fa-plus-square"></i>More Details</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <%
                        }
                    } else{
                    %>
                    <img href="shop.jsp" src="pics/emptyWishlist.png" alt="">

                    <%
                        }
                    %>


                </div><!--features_items-->


            </div>
        </div>
    </div>
</section>


<%@ include file="footer.jsp"  %>

</body>
</html>

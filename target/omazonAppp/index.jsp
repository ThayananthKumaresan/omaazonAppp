<%@ page import="com.example.omazonwebappp.Product" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="static com.example.omazonwebappp.DAOObjects.productDAO" %>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Home | Omazon</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/prettyPhoto.css" rel="stylesheet">
    <link href="css/price-range.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/main.css" rel="stylesheet">
    <link href="css/responsive.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->

    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
</head><!--/head-->

<body>
<%@ include file="header.jsp"  %>

<section id="slider"><!--slider-->
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <div id="slider-carousel" class="carousel slide" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#slider-carousel" data-slide-to="0" class="active"></li>
                        <li data-target="#slider-carousel" data-slide-to="1"></li>
                        <li data-target="#slider-carousel" data-slide-to="2"></li>
                    </ol>

                    <div class="carousel-inner">
                        <div class="item active">
                            <div class="col-sm-6">
                                <h1><span>O</span>-MAZON</h1>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p>
                                <button type="button" class="btn btn-default get">Get it now</button>
                            </div>
                            <div class="col-sm-6">
                                <img src="images/home/girl1.jpg" class="girl img-responsive" alt="" />
                                <img src="images/home/pricing.png"  class="pricing" alt="" />
                            </div>
                        </div>
                        <div class="item">
                            <div class="col-sm-6">
                                <h1><span>O</span>-MAZON</h1>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p>
                                <button type="button" class="btn btn-default get">Get it now</button>
                            </div>
                            <div class="col-sm-6">
                                <img src="images/home/girl2.jpg" class="girl img-responsive" alt="" />
                                <img src="images/home/pricing.png"  class="pricing" alt="" />
                            </div>
                        </div>

                        <div class="item">
                            <div class="col-sm-6">
                                <h1><span>O</span>-MAZON</h1>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p>
                                <button type="button" class="btn btn-default get">Get it now</button>
                            </div>
                            <div class="col-sm-6">
                                <img src="images/home/girl3.jpg" class="girl img-responsive" alt="" />
                                <img src="images/home/pricing.png" class="pricing" alt="" />
                            </div>
                        </div>

                    </div>

                    <a href="#slider-carousel" class="left control-carousel hidden-xs" data-slide="prev">
                        <i class="fa fa-angle-left"></i>
                    </a>
                    <a href="#slider-carousel" class="right control-carousel hidden-xs" data-slide="next">
                        <i class="fa fa-angle-right"></i>
                    </a>
                </div>

            </div>
        </div>
    </div>
</section><!--/slider-->

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
                    <h2 class="title text-center">Top Selling Products</h2>
                    <%

                        ArrayList<Product> top3SellingProducts = productDAO.getTop3SellingProduct();

                        Product product=null;
                        for (int i = 0; i < top3SellingProducts.size(); i++){
                             product = top3SellingProducts.get(i);
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
                                    <%if(sessionCustomer.getCustomerID()!=0){%>
                                    <li><a href="Customer_Wishlist.jsp?productIDForWishlist=<%=product.getProductID()%>&mode=add"><i class="fa fa-plus-square"></i>Add to Wishlist</a></li>
                                    <li><a href="Customer_Product_Display.jsp?productIDToDisplay=<%=product.getProductID()%>"><i class="fa fa-plus-square"></i>More Details</a></li>
                                    <%}%>
                                </ul>
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
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.scrollUp.min.js"></script>
<script src="js/price-range.js"></script>
<script src="js/jquery.prettyPhoto.js"></script>
<script src="js/main.js"></script>
</body>
</html>



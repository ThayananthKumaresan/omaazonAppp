
<%@ page import="com.example.omazonwebappp.Product" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="static com.example.omazonwebappp.DAOObjects.productDAO" %>
<%@ page import="static com.example.omazonwebappp.DAOObjects.*" %>
<%if(sessionCustomer.getCustomerID()==0){response.sendRedirect("index.jsp");}%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">
	<title>Shop | Omazon</title>
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
						if(request.getParameter("category") == null){
					%>
					<h2 class="title text-center"> All Products </h2>

					<%
						ArrayList<Product> listOfAllProducts = productDAO.getListOfAllProduct();
						for (int i = 0; i < listOfAllProducts.size(); i++) {
							Product product = listOfAllProducts.get(i);
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
									<li><a href="Customer_Wishlist.jsp?productIDForWishlist=<%=product.getProductID()%>&mode=add"><i class="fa fa-plus-square"></i>Add to Wishlist</a></li>
									<li><a href="Customer_Product_Display.jsp?productIDToDisplay=<%=product.getProductID()%>"><i class="fa fa-plus-square"></i>More Details</a></li>
								</ul>
							</div>
						</div>
					</div>
					<%
					}
					}
					else{
					%>
					<h2 class="title text-center"> Products under <%=category[Integer.parseInt(request.getParameter("category"))]%></h2>
					<%
						int categoryNo = Integer.parseInt(request.getParameter("category"));
						System.out.println(categoryNo);
						ArrayList<Product> listOfProductsBasedOnCategory = productDAO.getListOfProductsBasedOnCategory(category[categoryNo]);

						if (listOfProductsBasedOnCategory != null) {

							for (int i = 0; i < listOfProductsBasedOnCategory.size(); i++) {

								Product product = listOfProductsBasedOnCategory.get(i);
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
									<li><a href="Customer_Wishlist.jsp?productIDForWishlist=<%=product.getProductID()%>&mode=add"><i class="fa fa-plus-square"></i>Add to Wishlist</a></li>
									<li><a href="Customer_Product_Display.jsp?productIDToDisplay=<%=product.getProductID()%>"><i class="fa fa-plus-square"></i>More Details</a></li>
								</ul>
							</div>
						</div>
					</div>

					<%
						}
					}else{
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
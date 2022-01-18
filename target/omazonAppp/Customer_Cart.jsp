<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.omazonwebappp.*" %>
<%@ page import="static com.example.omazonwebappp.DAOObjects.cartDAO" %>
<%@ page import="static com.example.omazonwebappp.DAOObjects.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Cart | Omazon</title>
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

	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"> <!-- Icon-->
	<script src="https://code.jquery.com/jquery-3.5.1.js" charset="utf-8"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/js/bootstrap.min.js"></script> <!--Modal-->


	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"> <!-- Icon-->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

	<link rel="stylesheet" href="https://cdn.datatables.net/1.10.23/css/jquery.dataTables.min.css">
	<script src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js" charset="utf-8"></script>
	<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/datatables/1.10.16/js/dataTables.bootstrap4.js"></script>

	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.13.3/dist/sweetalert2.all.min.js" charset="utf-8"></script>


</head><!--/head-->

<body>
<%@ include file="header.jsp"  %>

	<section id="cart_items">
		<div class="container">
			<div class="breadcrumbs">
				<ol class="breadcrumb">
				  <li><a href="#">Home</a></li>
				  <li class="active">Shopping Cart</li>
				</ol>
			</div>
			<div class="table-responsive cart_info">
				<table id="table" class="table table-condensed">
					<thead>
						<tr class="cart_menu">
							<td class="image">Item</td>
							<td class="description"></td>
							<td class="price">Price</td>
							<td class="quantity">Quantity</td>
							<td class="total">Total</td>
							<td></td>
						</tr>
					</thead>
					<tbody>
					<%
						ArrayList<Cart> listOfCartOfThisCustomer = cartDAO.getListOfCartOfThisCustomer(sessionCustomer.getCustomerID()); //Integer.parseInt((String) session.getAttribute("customerID"))
						double totalAmount = 0.00;
						if (listOfCartOfThisCustomer != null) {
							for (int i = 0; i < listOfCartOfThisCustomer.size(); i++) {
								Cart cart = listOfCartOfThisCustomer.get(i);
								Product productsInCartToDisplay = productDAO.getProduct(cart.getCartProductID());
								Seller seller=sellerDAO.getSeller(productsInCartToDisplay.getProductSellerID());
					%>
						<tr>
							<td class="cart_product">
								<a href="Customer_Product_Display.jsp?productIDToDisplay=<%=productsInCartToDisplay.getProductID()%>"><img src="pics/<%=productsInCartToDisplay.getProductFilePath()%>" width="100px" alt=""></a>
							</td>
							<br>
							<br>
							<td class="cart_description">
								<h4><a href="Customer_Product_Display.jsp?productIDToDisplay=<%=productsInCartToDisplay.getProductID()%>"><%=productsInCartToDisplay.getProductName()%></a></h4>
								<h5> Shop Name : <%=seller.getSellerShopName()%> </h5>
							</td>
							<td class="cart_price">
								<p>RM <%=df.format(productsInCartToDisplay.getProductPrice())%></p>
							</td>
							<td class="cart_quantity">
								<form action="CartServlet" method="post"  >
									<input  type="hidden" name="mode" value="updateCartQuantity">
									<input  type="hidden" name="cartID" value="<%=cart.getCartID()%>">
									<div class="cart_quantity_button">
									<input class="cart_quantity_input text-center" required type="text" name="cartQuantity" value="<%=cart.getCartQuantity()%>" autocomplete="off" size="2">
								</div>
								<br>
								<br>
								<button type="submit"  id="updateCartQuantity" class="btn btn-default"  > Update Quantity</button>
								</form>

							</td>
							<td class="cart_total">
								<p class="cart_total_price">RM <%=df.format(productsInCartToDisplay.getProductPrice()*cart.getCartQuantity())%></p>
							</td>
							<td class="cart_delete">
								<form  id="delete-cart-product-<%=cart.getCartID()%>" action="CartServlet" method="post"  novalidate>
									<input  type="hidden" name ="mode" id="mode" value="delete" >
									<input type="hidden" name="cartIDToDeleteFromCart" value="<%=cart.getCartID()%>">
									<button type="submit"  id="deletebutton" class="btn btn-danger delete"  value="<%=cart.getCartID()%>" name="dltbtn"><i class="fas fa-trash"></i></button>
								</form>
							</td>
						</tr>

					<script>
						$ ("#delete-cart-product-<%=cart.getCartID()%>").on ("submit", function (event) {

							console.log("Delete cart");
							event.preventDefault ();
							let f = new FormData(this);

							Swal.fire({
								title: 'Are you sure?',
								text: "You won't be able to revert this!",
								icon: 'warning',
								showCancelButton: true,
								confirmButtonColor: '#3085d6',
								cancelButtonColor: '#d33',
								confirmButtonText: 'Yes, delete it!'
							}).then((result) => {
								if (result.isConfirmed) {
									$.ajax({
										type: "POST",
										url: "CartServlet",
										data:  f,
										success: function(){
										},
										error :function (data ,textStatus,jqXHR){
											console.log(" I have no idea an error happended")
										},
										processData : false,
										contentType:false
									});

									$(this).parent().parent().fadeOut(300, function(){ $(this).remove();});

									Swal.fire(
											'Deleted!',
											'Your product in the cart is deleted.',
											'success'
									).then(function () {
										window.location.replace('Customer_Cart.jsp');
									});



								}
							})

						})
					</script>
					<%
								totalAmount += productsInCartToDisplay.getProductPrice() * cart.getCartQuantity();
						}
					}else{
					%>
					<tr>
						<td colspan="5" class="text-center"> No products in cart</td>
					</tr>


					<%
								}

					%>
					</tbody>
				</table>
			</div>
		</div>
	</section> <!--/#cart_items-->

	<section id="do_action">
		<div class="container">
			<div class="heading">
				<h3>What would you like to do next?</h3>
				<p>Choose if you have a discount code or reward points you want to use or would like to estimate your delivery cost.</p>
			</div>
			<div class="row">
				<div class="col-sm-6">
					<div class="total_area">
						<ul>
							<li>Cart Sub Total <span>RM <%= df.format(totalAmount)%></span></li>
							<li>Total <span>RM <%= df.format(totalAmount)%></span></li>
						</ul>
							<a class="btn btn-default check_out" href="Customer_Checkout.jsp?totalCheckoutAmount=<%=df.format(totalAmount)%>">Check Out</a>
					</div>
				</div>
			</div>
		</div>
	</section><!--/#do_action-->

<%@ include file="footer.jsp"  %>
	


    <script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.scrollUp.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>


</body>
</html>
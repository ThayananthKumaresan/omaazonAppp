<%@ page import="com.example.omazonwebappp.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="static com.example.omazonwebappp.DAOObjects.feedbackDAO" %>
<%@ page import="static com.example.omazonwebappp.DAOObjects.*" %>
<%@ page import="java.text.DecimalFormat" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Product Details | Omazon</title>
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

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.13.3/dist/sweetalert2.all.min.js" charset="utf-8"></script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <!-- Icon-->
    <script src="https://code.jquery.com/jquery-3.5.1.js" charset="utf-8"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <!--Modal-->


    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <!-- Icon-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <style>
        #myImg {
            border-radius: 5px;
            cursor: pointer;
            transition: 0.3s;
        }

        #myImg:hover {
            opacity: 0.7;
        }

        /* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            padding-top: 100px; /* Location of the box */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0, 0, 0); /* Fallback color */
            background-color: rgba(0, 0, 0, 0.9); /* Black w/ opacity */
        }

        /* Modal Content (image) */
        .modal-content {
            margin: auto;
            display: block;
            width: 80%;
            max-width: 700px;
        }

        /* Caption of Modal Image */
        #caption {
            margin: auto;
            display: block;
            width: 80%;
            max-width: 700px;
            text-align: center;
            color: #ccc;
            padding: 10px 0;
            height: 150px;
        }

        /* Add Animation */
        .modal-content, #caption {
            -webkit-animation-name: zoom;
            -webkit-animation-duration: 0.6s;
            animation-name: zoom;
            animation-duration: 0.6s;
        }

        @-webkit-keyframes zoom {
            from {
                -webkit-transform: scale(0)
            }
            to {
                -webkit-transform: scale(1)
            }
        }

        @keyframes zoom {
            from {
                transform: scale(0)
            }
            to {
                transform: scale(1)
            }
        }

        /* The Close Button */
        .close {
            position: absolute;
            top: 15px;
            right: 35px;
            color: #f1f1f1;
            font-size: 40px;
            font-weight: bold;
            transition: 0.3s;
        }

        .close:hover,
        .close:focus {
            color: #bbb;
            text-decoration: none;
            cursor: pointer;
        }

        /* 100% Image Width on Smaller Screens */
        @media only screen and (max-width: 700px) {
            .modal-content {
                width: 100%;
            }
        }
    </style>

</head><!--/head-->

<body>
<%@ include file="header.jsp" %>

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
                                <h4 class="panel-title"><a href="Customer_Shop.jsp?category=<%=i%>"><%=category[i]%>
                                </a></h4>
                            </div>
                        </div>

                        <%

                            }
                        %>


                    </div><!--/category-productsr-->
                </div>
            </div>

            <div class="col-sm-9 padding-right">
                <div class="product-details"><!--product-details-->
                    <div class="col-sm-5">
                        <div class="view-product">

                            <%
								DecimalFormat dff = new DecimalFormat("0.0");
                                Product p = productDAO.getProduct(Integer.parseInt(request.getParameter("productIDToDisplay")));

                            %>
                            <img id="myImg" src="pics/<%=p.getProductFilePath()%>  " alt="<%=p.getProductName()%>"/>
                        </div>
                        <div id="similar-product" class="carousel slide" data-ride="carousel">

                            <!-- Controls -->
                            <a class="left item-control" href="#similar-product" data-slide="prev">
                                <i class="fa fa-angle-left"></i>
                            </a>
                            <a class="right item-control" href="#similar-product" data-slide="next">
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </div>

                    </div>
                    <div class="col-sm-7">
                        <div class="product-information"><!--/product-information-->
                            <form id="add-to-cart" action="CartServlet" method="post">
                                <img src="images/product-details/new.jpg" class="newarrival" alt=""/>
                                <h2><%=p.getProductName()%> </h2>
                                <span>
                                    <span>RM <%=df.format(p.getProductPrice())%></span>
                                   <br>
                                    <br>
                                    <br>
                                    <label>Quantity:</label>
              							<input type="hidden" name="mode" id="mode" value="add">
										<input type="hidden" name="productIDForCart" value="<%=p.getProductID()%>">
										<input type="hidden" name="customerID" value="<%=session.getAttribute("customerID")%>">
									    <input type="number" name="cartQuantity" value="1"/>
									<%
										if(!sellerDAO.getSeller(p.getProductSellerID()).getEmail().equals(sessionCustomer.getEmail()) && sessionCustomer.getCustomerID()!=0){

									%>

										<button type="submit" class="btn btn-default cart">
											<i class="fa fa-shopping-cart"></i>
											Add to cart
										</button>
									<%
										}
									%>
									</span>
                            </form>
                            <p> Rating : <%=dff.format(feedbackDAO.getAverageRatingOfThisProduct(p.getProductID()))%>/5</p>
                            <p><b>Availability: </b> In Stock</p>
                            <%

                                Seller seller = sellerDAO.getSeller(p.getProductSellerID());

                                ArrayList<Feedback> searchedProductFeedback = feedbackDAO.getListOfFeedbackOfThisProduct(p.getProductID());

                                int reviewsCount;
                                if (searchedProductFeedback != null) {
                                    reviewsCount = searchedProductFeedback.size();
                                } else {
                                    reviewsCount = 0;
                                }
                            %>
                            <p><b>Shop Name : </b> <%=seller.getSellerShopName()%>
                            </p>
                            <p><b>Category : </b> <%=p.getProductCategory()%>
                            </p>
                        </div><!--/product-information-->
                    </div>
                </div><!--/product-details-->

                <div class="category-tab shop-details-tab"><!--category-tab-->
                    <div class="col-sm-12">
                        <ul class="nav nav-tabs">
                            <li><a href="#details" data-toggle="tab">Details</a></li>
                            <li><a href="#companyprofile" data-toggle="tab">Company Profile</a></li>
                            <li class="active"><a href="#reviews" data-toggle="tab">Reviews (<%=reviewsCount%>)</a></li>
                        </ul>
                    </div>
                    <div class="tab-content">
                        <div class="tab-pane fade" id="details">
                            <p><%=p.getProductDescription()%>"</p>
                        </div>

                        <div class="tab-pane fade" id="companyprofile">

                            <table class="table">

                                <tbody>
                                <tr>
                                    <td rowspan="5"><img src="pics/<%=seller.getSellerShopImage()%>" width="200px"></td>
                                </tr>
                                <tr>
                                    <td>Shop Name :</td>
                                    <td><%=seller.getSellerShopName()%>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Seller Name :</td>
                                    <td><%=seller.getFirstName() + " " + seller.getLastName()%>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Seller Contact :</td>
                                    <td><%=seller.getSellerPhoneNumber()%>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Seller Business Registration Number :</td>
                                    <td><%=seller.getSellerBusinessRegistrationNumber()%>
                                    </td>
                                </tr>
                                </tbody>
                            </table>

                        </div>

                        <div class="tab-pane fade active in" id="reviews">
                            <table class="table">

                                <thead>
                                <tr>
                                    <th scope="col">User Review</th>
                                    <th scope="col">Comment by Seller</th>
                                </tr>
                                </thead>
                                <tbody>

                                <%
                                    if (searchedProductFeedback != null) {
                                        for (Feedback feedback : searchedProductFeedback) {

                                %>
                                <tr>
                                    <td>User <%=customerDAO.getCustomerUsername(feedback.getFeedbackCustomerID())%>
                                        : <%=feedback.getFeedbackReview()%>
                                    </td>
                                    <td><%=feedback.getFeedbackCommentBySeller()%>
                                    </td>
                                </tr>

                                <%
                                    }
                                } else {
                                %>

                                <tr>
                                    <td colspan="2"> No reviews yet !</td>

                                </tr>

                                <%

                                    }
                                %>
                                </tbody>
                            </table>
                        </div>

                    </div>
                </div><!--/category-tab-->


            </div>
        </div>
    </div>
</section>

<%@ include file="footer.jsp" %>


<script src="js/jquery.js"></script>
<script src="js/price-range.js"></script>
<script src="js/jquery.scrollUp.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.prettyPhoto.js"></script>
<script src="js/main.js"></script>

<div id="myModal" class="modal">
    <span class="close">&times;</span>
    <img class="modal-content" id="img01">
    <div id="caption"></div>
</div>

<script>
    // Get the modal
    var modal = document.getElementById("myModal");

    // Get the image and insert it inside the modal - use its "alt" text as a caption
    var img = document.getElementById("myImg");
    var modalImg = document.getElementById("img01");
    var captionText = document.getElementById("caption");
    img.onclick = function () {
        modal.style.display = "block";
        modalImg.src = this.src;
        captionText.innerHTML = this.alt;
    }

    // Get the <span> element that closes the modal
    var span = document.getElementsByClassName("close")[0];

    // When the user clicks on <span> (x), close the modal
    span.onclick = function () {
        modal.style.display = "none";
    }

</script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

<script>

    $("#add-to-cart").on("submit", function (event) {

        event.preventDefault();

        let f = new FormData(this);

        console.log(f);
        $.ajax({
            url: "CartServlet",
            type: 'POST',
            data: f,
            success: function (data, textStatus, jqXHR) {
                console.log("data");
                if (data.trim() == 'unsuccessful')
                    swal('Oops an error occurred!', 'Unable to add product', 'error');
                else {
                    swal({
                        icon: 'success',
                        title: 'Successfully added to cart !',
                        content: 'Your product is now in your cart !',
                        timer: 5000,
                        timerProgressBar: true,
                        didOpen: () => {
                            Swal.showLoading()
                            timerInterval = setInterval(() => {
                                const content = Swal.getContent()
                                if (content) {
                                    const b = content.querySelector('b')
                                    if (b) {
                                        b.textContent = Swal.getTimerLeft()
                                    }
                                }
                            }, 100)
                        }
                    }).then(function () {
                        window.location.replace('Customer_Product_Display.jsp?productIDToDisplay=<%=p.getProductID()%>');
                    });


                }

            },
            error: function (data, textStatus, jqXHR) {
                console.log(" I have no idea an error happended")
            },
            processData: false,
            contentType: false
        })
    })


</script>


</body>
</html>
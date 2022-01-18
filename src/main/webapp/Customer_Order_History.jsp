<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.omazonwebappp.*" %>
<%@ page import="java.util.Objects" %>
<%@ page import="static com.example.omazonwebappp.DAOObjects.ordersDAO" %>
<%@ page import="static com.example.omazonwebappp.DAOObjects.*" %><%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 1/11/2022
  Time: 10:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Order History | Omazon</title>
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
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
</head>


<style media="screen">

    .rating {
        float:left;
        border:none;
    }
    .rating:not(:checked) > input {
        position:absolute;
        top:-9999px;
        clip:rect(0, 0, 0, 0);
    }
    .rating:not(:checked) > label {
        float:right;
        width:1em;
        padding:0 .1em;
        overflow:hidden;
        white-space:nowrap;
        cursor:pointer;
        font-size:200%;
        line-height:1.2;
        color:#ddd;
    }
    .rating:not(:checked) > label:before {
        content:'★ ';
    }
    .rating > input:checked ~ label {
        color: #f70;
    }
    .rating:not(:checked) > label:hover, .rating:not(:checked) > label:hover ~ label {
        color: gold;
    }
    .rating > input:checked + label:hover, .rating > input:checked + label:hover ~ label, .rating > input:checked ~ label:hover, .rating > input:checked ~ label:hover ~ label, .rating > label:hover ~ input:checked ~ label {
        color: #ea0;
    }
    .rating > label:active {
        position:relative;
    }

    @import url(https://fonts.googleapis.com/css?family=Lato:300,300i,400,400i,700);
    /* 'container' class exists already in CF store */

    .order-breadcrumb a {
        color: #555;
        text-decoration: none;
        margin-right: 4px;
    }

    .order-breadcrumb a:hover {
        text-decoration: underline;
        color: #bada55;
    }

    .order-breadcrumb a.active {
        font-weight: 400;
        color: #bada55;
    }

    .title-row {
        font-family: "Lato", sans-serif;
        font-weight: 400;
        font-size: 30px;
        margin-bottom: 15px;
    }

    .title-row .page-title {
        width: 50%;
        float: left;
    }

    .title-row .page-title h1 {
        margin: 15px 0;
    }

    .title-row .search-orders {
        width: 50%;
        float: left;
        margin-top: 10px;
    }

    .title-row .search-orders input[type=text] {
        width: 75%;
        height: 24px;
        padding-left: 10px;
    }

    .title-row .search-orders input[type=submit] {
        border: none;
        background: #eee;
        border: 1px solid #ccc;
        border-radius: 2px;
        padding: 8px 10px;
        cursor: pointer;
    }

    .title-row .search-orders input[type=submit]:hover {
        background: #ddd;
    }

    .order_sorter {
        width: 100%;
        position: relative;
        padding-left: 5px;
        border-bottom: 1px solid #ddd;
        margin-bottom: 18px !important;
        -moz-box-sizing: border-box;
        -webkit-box-sizing: border-box;
        box-sizing: border-box;
        font-size: 13px;
        line-height: 19px;
        color: #111;
        font-family: "Lato", sans-serif;
        font-weight: 300;
    }

    .order_sorter ul {
        display: block;
        margin: 0;
        padding: 0;
    }

    .order_sorter li {
        list-style: none;
        display: inline-block;
        margin: 0 50px 0 0;
        position: relative;
        bottom: -1px;
        border-bottom-width: 2px;
        border-bottom-style: solid;
        border-bottom-color: transparent;
        word-wrap: break-word;
    }

    .order_sorter li.first {
        margin: 0 5px;
    }

    .order_sorter li.selected {
        border-bottom-color: #bada55;
        font-weight: 700;
    }

    .order_sorter a {
        text-decoration: none;
        color: #555;
    }

    .download-all {
        font-family: "Lato", sans-serif;
        font-weight: 300;
        text-align: center;
    }

    .download-all a.all-history {
        color: #555;
        font-size: 14px;
        font-weight: 300;
        text-decoration: none;
        padding: 6px 15px;
    }

    .download-all:hover {
        text-decoration: underline;
    }

    .post-sorter {
        font-family: "Lato", sans-serif;
        font-weight: 300;
        margin: 25px 0;
        text-align: center;
    }

    .post-sorter .order-number {
        font-size: 13px;
        font-weight: 400;
    }

    .post-sorter .order-sorter {
        cursor: pointer;
        margin: 0 5px;
        border-radius: 2px;
    }

    select {
        border: 1px solid #111;
        background: transparent;
        width: 150px;
        padding: 5px 35px 5px 5px;
        font-size: 12px;
        border: 1px solid #ccc;
        height: 30px;
        -webkit-appearance: none;
        -moz-appearance: none;
        appearance: none;
        background: url(data:image/gif;base64,R0lGODlhCwALAJEAAAAAAP///xUVFf///yH5BAEAAAMALAAAAAALAAsAAAIUnC2nKLnT4or00PvyrQwrPzUZshQAOw==) 96%/15% no-repeat #eee;
        background-size: 11px 11px;
    }

    /* CAUTION: IE hackery ahead */
    select::-ms-expand {
        display: none;
        /* remove default arrow on ie10 and ie11 */
    }

    .order-summary {
        font-family: "Lato", sans-serif;
        font-weight: 300;
        margin: 0 auto;
        margin-bottom: 20px;
        box-sizing: border-box;
    }

    .order-summary div {
        border: 1px solid #ddd;
        border-radius: 2px;
        width: 23.75%;
        float: left;
        box-sizing: border-box;
        margin-right: 15px;
        text-align: center;
        border-left: 4px solid #bada55;
        padding: 10px;
    }

    .order-summary div:last-child {
        margin-right: 0;
    }

    .order-summary div h2 {
        font-size: 24px;
        font-weight: 400;
    }

    .order-summary div h3 {
        font-size: 14px;
        font-weight: 300;
        margin-top: 5px;
    }

    .order-container {
        font-family: "Lato", sans-serif;
        font-weight: 300;
        font-size: 13px;
        border: 1px solid #ddd;
        background: #fff;
        margin-bottom: 15px;
    }

    .order-container .header {
        padding: 14px 18px;
        background: #fafafa;
        border-bottom: 1px solid #ddd;
    }

    .order-container .header .col-1 {
        float: left;
        width: 20%;
    }

    .order-container .header .col-2 {
        float: left;
        width: 15%;
    }

    .order-container .header .col-3 {
        float: left;
        width: 40%;
    }

    .order-container .header .col-4 {
        float: left;
        width: 25%;
    }

    .order-container .header span:nth-child(2) {
        display: block;
        font-weight: 600;
        margin-top: 4px;
    }

    .order-container .box {
        background: #fff;
        padding: 18px 18px;
    }

    .order-container .box img {
        max-width: 140px;
        border: 1px solid #ddd;
        box-shadow: 0;
        transition: box-shadow 0.5s;
    }

    .order-container .box img:hover {
        box-shadow: 0 0 3px #888;
    }

    .order-container .box .col-1 {
        float: left;
        width: 18%;
    }

    .order-container .box .col-2 {
        float: left;
        width: 62%;
    }

    .order-container .box .col-2 p {
        line-height: 1.4em;
        margin-bottom: 10px;
    }

    .order-container .box .col-2 .btn-default {
        width: 25%;
        font-size: 12px;
        padding: 5px;
    }

    .order-container .box .col-2 .error-title {
        width: 80%;
        text-align: center;
        margin: 10px 0;
        padding: 8px;
        border: 1px solid #ff3300;
        color: #ff3300;
    }

    .order-container .box .col-2 .product-title {
        font-size: 16px;
        font-weight: 400;
        display: block;
        margin-bottom: 5px;
    }

    .order-container .box .col-2 .product-title i {
        font-size: 12px;
        cursor: pointer;
        opacity: 0.5;
    }

    .order-container .box .col-3 {
        float: right;
        width: 20%;
    }

    .order-container .box a.btn-default {
        padding: 8px 0;
        background: #f3f3f3;
        border: 1px solid #ddd;
        color: #555;
        text-decoration: none;
        text-align: center;
        width: 100%;
        display: block;
        margin-bottom: 10px;
    }

    .order-container .box a.btn-default:hover {
        background: #eee;
    }

    .footer {
        position: fixed;
        left: 0;
        bottom: 0;
        width: 100%;
    }
</style>


</head>

<body>

<%@ include file="header.jsp" %>








<div class="content" style="">


    <div class="container">
        <br><br>
        <div class="breadcrumbs">
            <ol class="breadcrumb">
                <li><a href="#">Home</a></li>
                <li class="active">Order History</li>
            </ol>
        </div>
        <div class="row title-row">
            <div class="page-title">
                <h1>Your Orders</h1>
            </div>
        </div>


        <div class="row order_sorter">
            <ul id="toggle-orders">
                <li class="first"></li>
                <li class="oh selected"><a href="#">Order History</a></li>
                <li class="fo"><a href="#">Pending Orders</a></li>
                <li class="com"><a href="#">Completed/Delivered</a></li>
            </ul>
        </div>

        <div class="row" id="order-history">

            <%
                ArrayList<Orders> listOfOrders = ordersDAO.getListOfOrdersOfCustomer(sessionCustomer.getCustomerID());

                if (listOfOrders != null) {
                    for (int i = 0; i < listOfOrders.size(); i++) {
            %>


            <div class='order-container'>

                <div class='header'>
                    <div class='row'>
                        <div class='col-1'>
                            <span>ORDERS PLACED</span><span><%=listOfOrders.get(i).getOrderDate()%></span></div>
                        <div class='col-3'><span>ORDER#</span><span><%=listOfOrders.get(i).getOrderID()%></span></div>
                        <div class='col-8'>
                            <span>ORDER STATUS</span><span><%=listOfOrders.get(i).getOrderStatus()%></span></div>

                    </div>
                </div>
                <div class='box'>
                    <div class='row'>
                        <div class='col-1'>
                            <img src="pics/<%=productDAO.getProduct(listOfOrders.get(i).getOrderProductID()).getProductFilePath()%>"
                                 width='80' height='80'>
                        </div>
                        <div class='col-2'>
                            <span class='product-title'><%=productDAO.getProduct(listOfOrders.get(i).getOrderProductID()).getProductName()%> <i></i></span>
                            Total Quantity : <%= listOfOrders.get(i).getOrderProductID()%> <br>
                            Shop Name
                            : <%= sellerDAO.getSeller(productDAO.getProduct(listOfOrders.get(i).getOrderProductID()).getProductSellerID()).getSellerShopName()%>
                            <br>

                        </div>
                    </div>
                </div>

            </div>

            <%
                    }
                }
            %>


        </div><!-- end of Order History -->


        <div id="future-orders">

            <%

                if (listOfOrders != null) {
                    for (int i = 0; i < listOfOrders.size(); i++) {

                        if (Objects.equals(listOfOrders.get(i).getOrderStatus(), "Processing") || Objects.equals(listOfOrders.get(i).getOrderStatus(), "Unprocessed")) {

            %>
            <div class='order-container'>

                <div class='header'>
                    <div class='row'>
                        <div class='col-1'>
                            <span>ORDERS PLACED</span><span><%=listOfOrders.get(i).getOrderDate()%></span></div>

                        <div class='col-3'><span>ORDER#</span><span><%=listOfOrders.get(i).getOrderID()%></span></div>
                        <div class='col-8'>
                            <span>ORDER STATUS</span><span><%=listOfOrders.get(i).getOrderStatus()%></span></div>

                    </div>
                </div>
                <div class='box'>
                    <div class='row'>
                        <div class='col-1'>
                            <img src="pics/<%=productDAO.getProduct(listOfOrders.get(i).getOrderProductID()).getProductFilePath()%>"
                                 width='80' height='80'>
                        </div>
                        <div class='col-2'>
                            <span class='product-title'><%=productDAO.getProduct(listOfOrders.get(i).getOrderProductID()).getProductName()%> <i
                                    class='fa fa-pencil-square-o aria-hidden=true'></i></span>
                            Total Quantity <%= listOfOrders.get(i).getOrderProductID()%> <br>
                            Shop Name
                            : <%= sellerDAO.getSeller(productDAO.getProduct(listOfOrders.get(i).getOrderProductID()).getProductSellerID()).getSellerShopName()%>
                            <br>

                        </div>
                        <%
                            if (listOfOrders.get(i).getOrderStatus().equals("Processing")){
                        %>
                        <div class=col-3>
                            <a id="order-confirmation-<%=listOfOrders.get(i).getOrderID()%>"
                               class='btn-default' data-toggle="modal"  data-target="#orderConfirmationModal-<%=listOfOrders.get(i).getOrderID()%>" >
                                <i class='fa fa-check-square-o aria-hidden=true'></i>
                                Order Received Confirmation
                            </a>
                        </div>
                        <%
                            }
                        %>
                    </div>
                </div>

            </div>
            <div id="orderConfirmationModal-<%=listOfOrders.get(i).getOrderID()%>" class="modal fade" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Order Confirmation & Feedback</h4>
                            <button type="button" class="close" data-dismiss="modal" >&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <form  id="orderConfirmationForm" action="OrderServlet" method="post" >
                                    <input type="hidden" value="orderReceivedConfirmation" name="type">
                                    <input type="hidden" value="<%=listOfOrders.get(i).getOrderID()%>" name="ordersID">

                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" id="defaultCheck1" required>
                                        <label class="form-check-label" for="defaultCheck1" style="font-size: 18px">
                                            &nbsp; Yes , I would like to confirm that I received my product.
                                        </label>

                                    </div>
                                    <br>

                                    <p style="font-size: 18px"> Rate your product </p>
                                    <fieldset class="rating">
                                        <input type="radio" id="star5" name="productRating" value="5" />
                                        <label for="star5">5 stars</label>
                                        <input type="radio" id="star4" name="productRating" value="4" />
                                        <label for="star4">4 stars</label>
                                        <input type="radio" id="star3" name="productRating" value="3" />
                                        <label for="star3">3 stars</label>
                                        <input type="radio" id="star2" name="productRating" value="2" />
                                        <label for="star2">2 stars</label>
                                        <input type="radio" id="star1" name="productRating" value="1" />
                                        <label for="star1">1 star</label>
                                    </fieldset>
                                    <br>
                                    <br>

                                    <div class="form-group">
                                        <label for="exampleFormControlTextarea1" style="font-size: 18px">Please write your feedback </label>
                                        <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"  name="productFeedback"></textarea>
                                    </div>
                                    <div class="col-md-12 text-center">
                                    <button  class="btn btn-primary" type="submit" > Confirm Order and Submit Feedback </button>
                                    </div>
                                    <br>

                                </form>

                            </div>

                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-dismiss="modal" >Close</button>
                        </div>
                    </div>

                </div>
            </div>

            <%
                        }
                    }
                }
            %>


        </div><!-- end of future-orders -->


        <div id="completed-orders">

            <%

                if (listOfOrders != null) {
                    for (int i = 0; i < listOfOrders.size(); i++) {

                        if (Objects.equals(listOfOrders.get(i).getOrderStatus(), "Delivered")) {

            %>
            <div class='order-container'>

                <div class='header'>
                    <div class='row'>
                        <div class='col-1'>
                            <span>ORDERS PLACED</span><span><%=listOfOrders.get(i).getOrderDate()%></span></div>

                        <div class='col-3'><span>ORDER#</span><span><%=listOfOrders.get(i).getOrderID()%></span></div>
                        <div class='col-8'>
                            <span>ORDER STATUS</span><span><%=listOfOrders.get(i).getOrderStatus()%></span></div>

                    </div>
                </div>
                <div class='box'>
                    <div class='row'>
                        <div class='col-1'>
                            <img src="pics/<%=productDAO.getProduct(listOfOrders.get(i).getOrderProductID()).getProductFilePath()%>"
                                 width='80' height='80'>
                        </div>
                        <div class='col-2'>
                            <span class='product-title'><%=productDAO.getProduct(listOfOrders.get(i).getOrderProductID()).getProductName()%> <i
                                    class='fa fa-pencil-square-o aria-hidden=true'></i></span>
                            Total Quantity <%= listOfOrders.get(i).getOrderProductID()%> <br>
                            Shop Name
                            : <%= sellerDAO.getSeller(productDAO.getProduct(listOfOrders.get(i).getOrderProductID()).getProductSellerID()).getSellerShopName()%>
                            <br>

                        </div>
                    </div>
                </div>favorites

            </div>


            <%
                        }
                    }
                }
            %>


        </div><!-- end of completed-orders -->


    </div><!-- container ends -->


</div>


<%@ include file="footer.jsp" %>


<script src="js/jquery.js"></script>
<script src="js/price-range.js"></script>
<script src="js/jquery.scrollUp.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.prettyPhoto.js"></script>
<script src="js/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>


<script type="text/javascript">

    var successfulOrderConfirmationFlag = "<%=request.getParameter("successfulOrderConfirmationFlag")%>";
    if (successfulOrderConfirmationFlag === "successfulOrderConfirmation") {
        swal({
            icon: 'success',
            title: 'Order confirmation received ! Thank you !',
            content: 'Your product is now live !',
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
            window.location.replace('Customer_Order_History.jsp');
        });

    }




    $('#future-orders').css('display', 'none');
    $('#completed-orders').css('display', 'none');

    $('#toggle-orders li').click(function () {
        $('#toggle-orders li').not(this).removeClass('selected');
        $(this).addClass('selected');
    });


    $('.fo').click(function () {
        $('#order-history').hide();
        $('#future-orders').fadeIn('slow');
        $('#completed-orders').hide();

    });

    $('.oh').click(function () {
        $('#order-history').fadeIn('slow');
        $('#completed-orders').hide();
        $('#future-orders').hide();


    });

    $('.com').click(function () {
        $('#completed-orders').fadeIn('slow');
        $('#future-orders').hide();
        $('#order-history').hide();

    });

    // By default, selecting 'Past 6 months' on dropdown selector
    // $(function () {
    //     $('select option[value="6months"]').prop('selected', true);
    // });
</script>

</body>
</html>

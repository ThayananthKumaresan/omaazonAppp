<%@ page import="static com.example.omazonwebappp.DAOObjects.sessionCustomer" %>
<header id="header"><!--header-->
    <div class="header_top"><!--header_top-->
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <div class="contactinfo">
                        <ul class="nav nav-pills">
                            <li><a href=""><i class="fa fa-phone"></i> +2 95 01 88 821</a></li>
                            <li><a href=""><i class="fa fa-envelope"></i> info@omazon.com</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="social-icons pull-right">
                        <ul class="nav navbar-nav">
                            <li><a href=""><i class="fa fa-facebook"></i></a></li>
                            <li><a href=""><i class="fa fa-twitter"></i></a></li>
                            <li><a href=""><i class="fa fa-linkedin"></i></a></li>
                            <li><a href=""><i class="fa fa-dribbble"></i></a></li>
                            <li><a href=""><i class="fa fa-google-plus"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div><!--/header_top-->

    <div class="header-middle"><!--header-middle-->
        <div class="container">
            <div class="row">
                <div class="col-sm-4">
                    <div class="logo pull-left">
                        <a href="index.jsp"><img src="images/home/logo.png" alt="" /></a>
                    </div>
                </div>
                <form id="customer-logout-form" method="post" action="LogOutServlet">

                <div class="col-sm-8">
                    <div class="shop-menu pull-right">
                        <ul class="nav navbar-nav">

                            <%
                                if(sessionCustomer.getCustomerID()!= 0) {
                            %>
                            <li>
                            <li><a href="Customer_Profile.jsp"><i class="fa fa-user"></i> Account</a></li>
                            <li><a href="Customer_Wishlist.jsp"><i class="fa fa-star"></i> Wishlist</a></li>
                            <li><a href="Customer_Cart.jsp"><i class="fa fa-shopping-cart"></i> Cart</a></li>
                            <li><a href="Customer_Order_History.jsp"><i class="fa-history "></i> Order History</a></li>
                            <button class="btn btn-danger" type="submit">  <i class="fa fa-sign-out"></i> Log Out </button>
                            </li>
                            <%
                                }
                                else{
                            %>

                            <li><a id="NoLogin1"><i class="fa fa-user"></i> Account</a></li>
                            <li><a id="NoLogin2"><i class="fa fa-star"></i> Wishlist</a></li>
                            <li><a id="NoLogin3"><i class="fa fa-shopping-cart"></i> Cart</a></li>
                            <li><a href="Login-Sign-Up.jsp"><i class="fa fa-lock"></i> Login</a></li>

                            <%
                                }

                            %>
                        </ul>
                    </div>
                </div>
                </form>

            </div>
        </div>
    </div><!--/header-middle-->

    <div class="header-bottom"><!--header-bottom-->
        <div class="container">
            <div class="row">
                <div class="col-sm-9">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                    </div>
                    <div class="mainmenu pull-left">
                        <ul class="nav navbar-nav collapse navbar-collapse">
                            <li><a href="index.jsp">Home</a></li>
                            <li><a href="Customer_Shop.jsp">Shop</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="search_box pull-right">
                        <input  id="myInput" type="text" placeholder="Search"/>
                    </div>
                </div>
            </div>
        </div>
    </div><!--/header-bottom-->
</header><!--/header-->

<script src="js/jquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

<script >


    $( "#NoLogin1" ).click(function() {
        swal('Dear,guest you are not logged in !', 'Please login or register now !', 'error');
    });

    $( "#NoLogin2" ).click(function() {
        swal('Dear,guest you are not logged in !', 'Please login or register now !', 'error');
    });


    $( "#NoLogin3" ).click(function() {
        swal('Dear,guest you are not logged in !', 'Please login or register now !', 'error');
    });




    $ (document).ready (function (e) {
        $ ("#customer-logout-form").on ("submit", function (event) {

            event.preventDefault ();

            $. ajax ({
                url: "LogOutServlet",
                type: 'POST',
                success : function (data ,textStatus,jqXHR){

                        swal({
                            icon: 'success',
                            title: 'You are succesfully logged out ! !',
                            html: 'We are waiting for you to come back !',
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
                        }).then(function() {
                            window.location.replace('index.jsp');
                        });

                }
            })
        })
    })



    let input = document.getElementById("myInput");
    input.addEventListener("keyup", function(event) {
        if (event.keyCode === 13) {
            event.preventDefault();
            window.location.href='Customer_Searched_Product.jsp?term='+input.value;

        }
    });





</script>


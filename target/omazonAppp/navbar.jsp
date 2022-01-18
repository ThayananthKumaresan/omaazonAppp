<div id="main">
    <div class="header">
        <h1><span>O</span>-MAZON</h1>
    </div>
    <div id="navbar">
        <a>
            <button type="submit" class="navbar-toggler-icon" onclick="openNav()"><i class="fa fa-bars" ></i></button>
            <div class="right_area"> </div>
        </a>

    </div>
    <div class="topnav-right"><a>
        <form id="seller-logout-form" action="LogOutServlet" method="post">
        <button type="submit" class="logout_btn">LogOut </button>
        </form>

    </a>
    </div>
</div>
<div id="mySidebar" class="sidebar">
    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()"><i class="fa fa-bars" ></i></a>
    <a href="Seller_Dashboard.jsp"><i class="fa fa-fw fa-home"></i> Dashboard</a>
    <a href="Seller_Profile.jsp"><i class="fa fa-fw fa-user"></i> Profile</a>
    <a href="Seller_Product.jsp"><i class="fa fa-fw fa-list"></i> Product</a>
    <a href="Seller_Orders.jsp"><i class="fa fa-fw fa-cart-arrow-down"></i> Order</a>
    <a href="Seller_Notification.jsp"><i class="fa fa-bell"></i> Notification</a>
    <a href="Seller_Payment.jsp"><i class="fa fa-credit-card"></i> Payment</a>
    <a href="Seller_Feedback.jsp"><i class="fas fa-comments"></i> Feedback</a>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

<script>

    $ (document).ready (function (e) {
        $ ("#seller-logout-form").on ("submit", function (event) {

            event.preventDefault ();

            $. ajax ({
                url: "LogOutServlet",
                type: 'POST',
                success : function (data ,textStatus,jqXHR){

                    swal({
                        icon: 'success',
                        title: 'You are successfully logged out ! !',
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

</script>
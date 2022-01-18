<%@ page import="com.example.omazonwebappp.CustomerDaoImp" %>
<%@ page import="com.example.omazonwebappp.Customer" %>
<%@ page import="com.example.omazonwebappp.CustomerDao" %>
<%@ page import="java.io.*" %>

<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 12/31/2021
  Time: 6:00 PM
  To change this template use File | Settings | File Templates.
--%>
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

    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
</head><!--/head-->

<body>

<%@ include file="header.jsp" %>

<section id="form"><!--form-->
    <div class="container">
        <div class="row">
            <div class="col-sm-4 col-sm-offset-1">
                <div class="login-form"><!--login form-->
                    <h2>Login to your account</h2>
                    <form id="login-form" action="LoginServlet" method="post">

                        <div class="form-row">
                            <div class="form-group col-md-12">
                                <label for="inputEmail4">Email</label>
                                <input name="email" id="email" type="text" class="form-control" required placeholder="Email">
                            </div>

                        </div>

                        <div class="form-row">
                            <div class="form-group col-md-12">
                                <label for="inputPassword4">Password</label>
                                <input name="password" id="password" type="password" class="form-control"
                                       required placeholder="Password">
                            </div>

                        </div>

                        <button type="submit" class="btn btn-default">Login</button>
                        <button onclick="window.location.href='Seller_Login.jsp'" type="button" class="btn btn-default">
                            <i class="fa fa-user"></i> Seller Login
                        </button>
                    </form>

                </div><!--/login form-->
            </div>


            <div class="col-sm-1">
                <h2 class="or">OR</h2>
            </div>
            <div class="col-sm-4">
                <div class="signup-form"><!--sign up form-->
                    <h2>New User Signup !</h2>

                    <form id="signup-form" action="RegisterServlet" method="post">

                        <input  type="hidden"  id="role" value="customer" >

                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="inputEmail4">Email</label>
                                <input type="email" class="form-control" id="emailREG" required placeholder="Email">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="inputPassword4">Username</label>
                                <input type="text" class="form-control" id="username" required placeholder="Username">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="inputEmail4">Account Password</label>
                                <input type="password" class="form-control" id="passwordREG"
                                       required placeholder="Account Password">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="inputPassword4">Wallet Password</label>
                                <input type="password" class="form-control" id="paymentPassword"
                                       required placeholder="Wallet Password">
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="inputEmail4">First Name</label>
                                <input type="text" class="form-control" id="firstName" required placeholder="First Name">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="inputPassword4">Last Name</label>
                                <input type="text" class="form-control" id="lastName" required placeholder="Last Name">
                            </div>
                        </div>

                        <div class="form-row">

                            <div class="form-group col-md-6">
                                <label for="inputAddress">Contact Number</label>
                                <input type="text" class="form-control" id="contactNum" required placeholder="Contact Number">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="inputAddress">Address</label>
                                <input type="text" class="form-control" id="address" required placeholder="Address">
                            </div>

                        </div>

                            <div class="form-group col-md-12 text-center">
                                <button type="submit" class="btn btn-default">Signup</button>
                            </div>


                    </form>
                </div><!--/sign up form-->
            </div>
        </div>
    </div>
</section><!--/form-->


<%@ include file="footer.jsp" %>


<script src="js/jquery.js"></script>
<script src="js/price-range.js"></script>
<script src="js/jquery.scrollUp.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.prettyPhoto.js"></script>
<script src="js/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

<script>
    $(document).ready(function (e) {
        $("#login-form").on("submit", function (event) {

            event.preventDefault();
            var form = {
                password: $("#password").val(),
                email: $("#email").val(),
                userRole: "customer"
            };

            console.log("$(#login-form).on(submit, function (event) {");
            $.ajax({
                url: "LoginServlet",
                type: 'POST',
                data: form,
                success: function (data, textStatus, jqXHR) {
                    console.log(data);
                    if (data.trim() == 'unsuccessful')
                        swal('Invalid Username/Password entered!', 'Please check your credentials again !', 'error');
                    else {
                        swal({
                            icon: 'success',
                            title: 'Omazon Welcomes You !',
                            html: 'Welcome back !',
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
                            window.location.replace('index.jsp');
                        });


                    }
                },error :function (){
                    console.log(" I have no idea an error happended")
                }
            })
        })
    })


    $(document).ready(function (e) {
        $("#signup-form").on("submit", function (event) {

            event.preventDefault();
            var form = {
                email: $("#emailREG").val(),
                username: $("#username").val(),
                password: $("#passwordREG").val(),
                firstName: $("#firstName").val(),
                lastName: $("#lastName").val(),
                paymentPassword: $("#paymentPassword").val(),
                address: $("#address").val(),
                contactNum: $("#contactNum").val(),
                role: $("#role").val()

            };

            console.log(form);

            $.ajax({
                url: "RegisterServlet",
                type: 'POST',
                data: form,
                success: function (data, textStatus, jqXHR) {
                    console.log(data);

                    if (data.trim() == "successful") {
                        swal({
                            icon: 'success',
                            title: 'You are succesfully registered ! You may now log in !',
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
                        })
                    } else if (data.trim() == "usedEmailFlag") {
                        swal('Similar email exist ! ', 'Please enter new email address !', 'error');
                    } else if (data.trim() == "usedUsernameFlag") {
                        swal('Similar username exist ! ', 'Please enter new username !', 'error');
                    }


                }
            })
        })
    })


</script>


</body>
</html>


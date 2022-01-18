<%@ page import="com.example.omazonwebappp.*" %>
<%@ page import="static com.example.omazonwebappp.DAOObjects.customerDAO" %>
<%@ page import="static com.example.omazonwebappp.DAOObjects.df" %>


<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 1/10/2022
  Time: 4:35 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Profile</title>
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
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.13.3/dist/sweetalert2.all.min.js" charset="utf-8"></script>
</head>


<style>

    .form-control:focus {
        box-shadow: none;
        border-color: #BA68C8
    }

    .profile-button {
        background: rgb(99, 39, 120);
        box-shadow: none;
        border: none
    }

    .profile-button:hover {
        background: #682773
    }

    .profile-button:focus {
        background: #682773;
        box-shadow: none
    }

    .profile-button:active {
        background: #682773;
        box-shadow: none
    }

    .back:hover {
        color: #682773;
        cursor: pointer
    }

    .labels {
        font-size: 11px
    }

    .add-experience:hover {
        background: #BA68C8;
        color: #fff;
        cursor: pointer;
        border: solid 1px #BA68C8
    }

</style>

</head>

<body>
<%@ include file="header.jsp" %>

<%
    Customer customer = customerDAO.getCustomer(sessionCustomer.getCustomerID());

%>

<div id="registerAsSellerModal" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Register as Seller</h4>
                <button type="button" class="close" data-dismiss="modal" >&times;</button>
            </div>
            <div class="modal-body">

                <div class="alert alert-info" role="alert">
                    <i class="fa-info-circle"></i> Note : Your current email and password will be used when you log in to your seller account.
                </div>
                <form id="registerAsSeller" action="RegisterServlet"  method="post"  >

                    <input  type="hidden" name ="role" id="role" value="seller" >

                    <div class="form-group">
                        <label >IC Number</label>
                        <input class="form-control"  required  type="text" name ="sellerIC" id="sellerIC" placeholder ="Your IC Number" >
                    </div>


                    <div class="form-group">
                        <label> Shop Address</label>
                        <input class="form-control"  required  type="text" name="sellerAddress" id="sellerAddress"  placeholder ="Your Shop Address" >
                    </div>

                    <div class="form-group">
                        <label>Shop Name</label>
                        <input class="form-control"  required  type="text" name="sellerShopName" id="sellerShopName"  placeholder ="Your Shop Name" >
                    </div>

                    <div class="form-group">
                        <label > Business Registration Number </label>
                        <input class="form-control"  required  type="text"  name="sellerBusinessRegNum"  id="sellerBusinessRegNum"  placeholder="Your Business Registration Number " >
                    </div>

                    <div class="form-group">
                        <label>Bank Account</label>
                        <input class="form-control"  required  type="text" id="sellerBankAcc"  name="sellerBankAcc"  placeholder ="Your Bank Account " >
                    </div>

                    <button  class="btn btn-primary" type="submit" name="registerAsSellerButton" > Register Now </button>
                </form>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal" >Close</button>
            </div>
        </div>

    </div>
</div>

<div id="topUpModal" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Top Up Wallet</h4>
                <button type="button" class="close" data-dismiss="modal" >&times;</button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label >Amount in RM </label>
                    <form  id="topUpForm" action="WalletTopUpServlet" method="post" >
                        <input class="form-control"  required  type="text" id ="topUpAmount"  name="topUpAmount" placeholder ="Enter the amount to Top Up" >
                        <button  class="btn btn-primary" type="submit" > Confirm Top Up </button>
                    </form>

                </div>

            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal" >Close</button>
            </div>
        </div>

    </div>
</div>





<div class="container rounded bg-white mt-5 mb-5">
    <div class="breadcrumbs">
        <ol class="breadcrumb">
            <li><a href="#">Home</a></li>
            <li class="active">Profile</li>
        </ol>
    </div>
    <div class="row">
        <div class="col-md-3 border-right">
            <div class="d-flex flex-column align-items-center text-center p-3 py-5">
                <img class="rounded-circle mt-5" width="150px" src="pics/<%=customer.getProfileImage()%>">
                <br>
                <br>
                <div class="mt-5 text-center">
                    <form id="upload-profile" action="ProfileServlet"  method="post"  enctype="multipart/form-data" >
                        <input hidden id="userRole" name="userRole" value="customer">
                        <input hidden id="type" name="type" value="profileImage">
                        <input class="form-control" type="file" name="profileImage" id="profileImage" required accept="image/*">
                        <button type="submit" id="uploadProfileImage" class="btn btn-primary profile-button" type="button">
                            Upload Profile Image
                        </button>

                    </form>
                    <%
                        if(customer.getRegisteredAsSeller()){
                    %>

                    <button onclick="window.location.href='Seller_Login.jsp'" type="button" class="btn btn-default">
                        <i class="fa fa-user"></i> Seller Login
                    </button>

                    <%}else
                    {
                    %>
                    <button class="btn btn-dark" type="button" id="popup" data-toggle="modal"  data-target="#registerAsSellerModal">Register As Seller</button>

                    <%
                        }
                    %>
                    <br>
                    <br>

                    <form id="delete-account" method="post" action="ProfileServlet">
                        <input hidden name="userRole" value="customer">
                        <input hidden name="type" value="deleteAccount">
                        <button class="btn btn-danger" type="submit"  >Delete My Account</button>
                    </form>

                </div>

            </div>
        </div>

        <div class="col-md-5 border-right">
            <div class="p-3 py-5">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h4 class="text-left">Profile Settings</h4>
                </div>
                <div class="row mt-2">
                    <div class="col-md-12"><label class="labels">Username</label><input type="text"
                                                                                        class="form-control"
                                                                                        id="userName"
                                                                                        placeholder="Enter Username"
                                                                                        value="<%=customer.getUserName()%>">
                    </div>
                    <div class="col-md-6"><label class="labels">First Name</label><input type="text"
                                                                                         class="form-control"
                                                                                         id="firstName"
                                                                                         placeholder="First Name"
                                                                                         value="<%=customer.getFirstName()%>">
                    </div>
                    <div class="col-md-6"><label class="labels">Last Name</label><input type="text"
                                                                                        class="form-control"
                                                                                        id="lastName"
                                                                                        placeholder="Last Name"
                                                                                        value="<%=customer.getLastName()%>">
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col-md-12"><label class="labels">Contact Number</label><input type="text"
                                                                                              class="form-control"
                                                                                              id="contactNum"
                                                                                              placeholder="Enter Contact Number"
                                                                                              value="<%=customer.getContactNum()%>">
                    </div>
                    <div class="col-md-12"><label class="labels">Address</label><input type="text"
                                                                                       class="form-control"
                                                                                       id="address"
                                                                                       placeholder="Enter Address "
                                                                                       value="<%=customer.getAddress()%>">
                    </div>
                    <div class="col-md-12"><label class="labels">Email</label><input type="email"
                                                                                     class="form-control" id="email"
                                                                                     placeholder="Enter Email"
                                                                                     value="<%=customer.getEmail()%>">
                    </div>
                </div>
                <div class="mt-5 text-center">
                    <button type="submit" id="saveProfileButton" class="btn btn-primary profile-button"
                            type="button">Save Profile
                    </button>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="p-3 py-5">
                <div class="d-flex justify-content-between align-items-center experience"><span>&nbsp; &nbsp; Manage Password</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button
                        type="button" class="btn btn-info" onclick="showHidePassword()">Show/Hide Password
                </button>
                </div>
                <br>
                <div class="col-md-12"><label class="labels">Account Password </label><input type="password"
                                                                                             class="form-control"
                                                                                             id="password"
                                                                                             placeholder="Enter your account password"
                                                                                             value="<%=customer.getPassword()%>">
                </div>
                <br>
                <div class="col-md-12"><label class="labels">Wallet Password </label><input type="password"
                                                                                            class="form-control"
                                                                                            id="paymentPassword"
                                                                                            placeholder="Enter your wallet password"
                                                                                            value="<%=customer.getPaymentPassword()%>">
                </div>
            </div>
            <div class="mt-5 text-center">
                <button type="submit" id="savePasswordsButton" class="btn btn-primary profile-button" type="button">Save
                    Passwords
                </button>
            </div>

        </div>
    </div>


    <div class="col-md-3 border-right">
        <div class="d-flex flex-column align-items-center text-center p-3 py-5"><img class="pics/whitebg.jpg"><span
                class="font-weight-bold" style="color: white">Edogaru</span><span style="color: white"
                                                                                  class="text-black-50">edogaru@mail.com.my</span><span> </span>
        </div>
    </div>


    <div class="col-md-5 border-right">
        <div class="p-3 py-5">
            <div class="d-flex justify-content-between align-items-center mb-3">
                <h4 class="text-left">Wallet Information</h4>
            </div>
            <div class="row mt-2">
                <div class="col-md-6"><label>Wallet Balance :
                    RM <%=df.format(customer.getUserWallet().getWalletBalance())%>
                </label></div>
            </div>
            <div class="row mt-3">
                <div class="col-md-12">
                    <button type="button"  data-toggle="modal"  data-target="#topUpModal" class="btn btn-dark">Top Up</button> &nbsp;&nbsp;

                    <button type="button" id="showTransaction" class="btn btn-dark showTransaction">Show past
                        Transaction
                    </button>
                </div>
                <div class="col-md-12">

                    <table class="table" id="transactionTable" style="display: none">
                        <thead class="thead-dark">
                        <tr>
                            <th scope="row">Transaction ID</th>
                            <th scope="row">Transaction Amount</th>
                            <th scope="row">Transaction Date</th>
                        </tr>

                        </thead>

                        <tbody>
                        <%
                            if (customer.getUserWallet().getWalletTransaction() != null) {
                                for (int i = 0; i < customer.getUserWallet().getWalletTransaction().size(); i++) {
                                    Transaction printTransaction = customer.getUserWallet().getWalletTransaction().get(i);

                        %>
                        <tr class="trclass">
                            <td><%="TR" + printTransaction.getTransactionID()%>
                            </td>
                            <td><%="RM " + df.format(printTransaction.getTransactionAmount())%>
                            </td>
                            <td><%=printTransaction.getTransactionDateTime()%>
                            </td>
                        </tr>

                        <%
                            }


                        } else {
                        %>


                        <td class="text-center" colspan="3">No Transaction yet !</td>

                        <%
                            }
                        %>
                        </tbody>
                    </table>
                </div>
            </div>

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </div>
    </div>


</div>
</div>
</div>


<%@ include file="footer.jsp" %>


</body>
</html>


<script src="js/jquery.js"></script>
<script src="js/price-range.js"></script>
<script src="js/jquery.scrollUp.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.prettyPhoto.js"></script>
<script src="js/main.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

<script>

    var successfulTopUpFlag = "<%=request.getParameter("successfulTopUpFlag")%>";
    if (successfulTopUpFlag === "successfulTopUp") {
        swal({
            icon: 'success',
            title: 'Successfully topped up your wallet !',
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
            window.location.replace('Customer_Profile.jsp');
        });

    }

    $ ("#delete-account").on ("submit", function (event) {

        event.preventDefault ();
        let f = new FormData(this);

        console.log("show confirm modal");
        Swal.fire({
            title: 'Please confirm if you would like to delete your account !',
            text: "You won't be able to revert this!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, delete it!'
        }).then((result) => {
            if (result.isConfirmed) {
                Swal.fire(
                    'Deleted!',
                    'Your file has been deleted.',
                    'success'
                )
                console.log("Deleted modal");

                $.ajax({
                    type: "POST",
                    url: "ProfileServlet",
                    data:  f,
                    success: function(){
                        console.log("success");
                        window.location.href="index.jsp";

                    },
                    error :function (data ,textStatus,jqXHR){
                        console.log(" I have no idea an error happended")
                    },
                    processData : false,
                    contentType:false
                });
            }
        })

    })



</script>
<script>

    function showHidePassword() {
        var x = document.getElementById("password");
        if (x.type === "password") {
            x.type = "text";
        } else {
            x.type = "password";
        }

        var y = document.getElementById("paymentPassword");
        if (y.type === "password") {
            y.type = "text";
        } else {
            y.type = "password";
        }

    }



    $(document).ready(function () {
        let showStatus = false;
        $("#showTransaction").click(function () {
            if (!showStatus) {

                $("#transactionTable").hide();
                $("#transactionTable").show();
                showStatus = true;
                $(this).text("Hide")

            } else if (showStatus == true) {

                $("#transactionTable").show();
                $("#transactionTable").hide();
                showStatus = false;
                $(this).text("Show Transaction")

            }

        });

        $('#saveProfileButton').click(function () {

            let form = {
                email: $("#email").val(),
                userName: $("#userName").val(),
                firstName: $("#firstName").val(),
                lastName: $("#lastName").val(),
                contactNum: $("#contactNum").val(),
                address: $("#address").val(),
                userRole: "customer",
                type: "profile"
            };
            console.log(form);

            $.ajax({
                url: "ProfileServlet",
                type: 'POST',
                data: form,
                success: function (data, textStatus, jqXHR) {
                    console.log(data);

                    if (data.trim() === "successful") {
                        swal({
                            icon: 'success',
                            title: 'You profile is succesfully updated!',
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
                            window.location.replace('Customer_Profile.jsp');
                        });
                    }//else if (data.trim() === "usedEmailFlag") {
                    //     swal('Similar email exist ! ', 'Please enter new email address !', 'error');
                    // } else if (data.trim() === "usedUsernameFlag") {
                    //     swal('Similar username exist ! ', 'Please enter new username !', 'error');
                    // }


                }
            })


        });

        $('#savePasswordsButton').click(function () {

            var form = {
                password: $("#password").val(),
                paymentPassword: $("#paymentPassword").val(),
                userRole: "customer",
                type: "password"
            };

            $.ajax({
                url: "ProfileServlet",
                type: 'POST',
                data: form,
                success: function (data, textStatus, jqXHR) {
                    console.log(data);

                    if (data.trim() === "successful") {
                        swal({
                            icon: 'success',
                            title: 'You password is successfully updated !',
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
                            window.location.replace('Customer_Profile.jsp');
                        });

                    }


                }
            })

        });

        $ ("#upload-profile").on ("submit", function (event) {

            event.preventDefault ();

            let f = new FormData(this);

            $. ajax ({
                url: "ProfileServlet",
                type: 'POST',
                data: f,
                success : function (data ,textStatus,jqXHR){
                    console.log(data);
                    if(data.trim() === 'unsuccessful')
                        swal('Oops an error occured!', 'Unable to add product', 'error');
                    else
                    {
                        swal({
                            icon: 'success',
                            title: 'You profile image is successfully updated!',
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
                        }).then(function() {
                            window.location.replace('Customer_Profile.jsp');
                        });


                    }

                },
                error :function (data ,textStatus,jqXHR){
                    console.log(" I have no idea an error happended")
                },
                processData : false,
                contentType:false
            })
        })

        $ ("#registerAsSeller").on ("submit", function (event) {

            event.preventDefault ();

            let f = new FormData(this);

            $. ajax ({
                url: "RegisterServlet",
                type: 'POST',
                data: f,
                success : function (data ,textStatus,jqXHR){
                    console.log(data);
                    if(data.trim() === 'unsuccessful')
                        swal('Oops an error occured!', 'Unable to add product', 'error');
                    else
                    {
                        swal({
                            icon: 'success',
                            title: 'Successfully registered as Seller ! , you will be now redirected to Seller Login Page.',
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
                        }).then(function() {
                            window.location.replace('Seller_Login.jsp');
                        });


                    }

                },
                error :function (data ,textStatus,jqXHR){
                    console.log(" I have no idea an error happened")
                },
                processData : false,
                contentType:false
            })
        })

    });

</script>




</body>
</html>

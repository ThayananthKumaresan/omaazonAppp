<%@ page import="static com.example.omazonwebappp.DAOObjects.*" %>
<%@ page import="com.example.omazonwebappp.Seller" %>
<%if(sessionSeller.getSellerID()==0){response.sendRedirect("index.jsp");}%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Manage Profile</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Manage Profile</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="admin.css">
    <link rel="stylesheet" href="navbarcss.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/css/bootstrap.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.5/umd/popper.js"></script>
    <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/datatables/1.10.16/js/dataTables.bootstrap4.js"></script>
    <script src="https://js.pusher.com/7.0/pusher.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/promise-polyfill@8/dist/polyfill.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.13.3/dist/sweetalert2.all.min.js" charset="utf-8"></script>
</head>
<body>


<%@ include file="navbar.jsp"  %>

<%
    Seller seller= sellerDAO.getSeller(sessionSeller.getSellerID());
%>

<!-- main -->

<div class="container rounded bg-white mt-5 mb-5">
    <div class="row">

        <div class="col-md-3 border-right">
            <div class="d-flex flex-column align-items-center text-center p-3 py-5">
                <img class="rounded-circle mt-5"
                     width="150px"
                     src="pics/<%=seller.getSellerShopImage()%>">
                <br>
                <br>
                <br>
                <form id="upload-profile" action="ProfileServlet"  method="post"  enctype="multipart/form-data" >
                    <input hidden id="userRole" name="userRole" value="seller">
                    <input hidden id="type" name="type" value="sellerProfileImage">
                    <input class="form-control" type="file" name="sellerProfileImage" id="sellerProfileImage" required accept="image/*">
                    <br>
                    <br>
                    <button type="submit" id="uploadProfileImage" class="btn btn-primary profile-button" type="button">
                        Upload Profile Image
                    </button>
                </form>

            </div>
        </div>

            <div class="col-md-5 border-right">
                <div class="p-3 py-5">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <h4 class="text-left">MANAGE PROFILE</h4>
                    </div>
                    <form action="ProfileServlet" method="post" >
                        <input name="userRole" type="hidden" value="seller">
                        <input name="type" type="hidden" value="none">
                        <div class="row mt-2">
                        <div class="col-md-6"><label class="labels">Shop Name </label><input type="text" class="form-control" name="shopName" placeholder="Enter Shop Name" value="<%=seller.getSellerShopName()%>"></div>
                        <div class="col-md-6"><label class="labels">Mobile Number</label><input type="text" class="form-control" name="sellerPhoneNumber" placeholder="Enter Phone Number" value="<%=seller.getSellerPhoneNumber()%>"></div>
                        <div class="col-md-6"><label class="labels">Business Registration Number</label><input type="text" class="form-control" name="sellerBusinessRegistrationNumber" placeholder="Enter Business Registration Number" value="<%=seller.getSellerBusinessRegistrationNumber()%>"></div>
                        <div class="col-md-6"><label class="labels">Bank Account Number</label><input type="text" class="form-control" name="sellerBankAccount" placeholder="Enter Bank Account" value="<%=seller.getSellerBankAccount()%>"></div>
                       <div class="col-md-6"><label class="labels">Identification Number</label><input type="text" class="form-control" name="sellerIC" placeholder="Enter Identification Number" value="<%=seller.getSellerIC()%>"></div>
                        </div>
                    <div class="row mt-3">
                        <div class="col-md-12"><label class="labels">Shop Address</label><input type="text" class="form-control"name="sellerAddress" placeholder="Enter Shop Address " value="<%=seller.getSellerShopAddress()%>"></div>
                    </div>
                    <div class="mt-5 text-center"><button type="submit" class="btn btn-primary profile-button" type="button">Save Profile</button></div>
                    </form>

                </div>
            </div>

    </div>


</div>

<%@ include file="script.jsp"  %>

<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

<script>

    var successfulProfileUpdateFlag = "<%=request.getParameter("successfulProfileUpdateFlag")%>";
    if(successfulProfileUpdateFlag === "successfulProfileUpdate") {
        swal({
            icon: 'success',
            title: 'Successfully updated your profile !',
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
            window.location.replace('Seller_Profile.jsp');
        });
    }

    <%request.setAttribute("successfulProfileUpdateFlag",null); %>


</script>


</body>
</html>

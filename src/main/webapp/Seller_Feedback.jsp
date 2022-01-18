<%@ page import="com.example.omazonwebappp.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="static com.example.omazonwebappp.DAOObjects.sessionSeller" %>
<%@ page import="static com.example.omazonwebappp.DAOObjects.feedbackDAO" %>
<%@ page import="static com.example.omazonwebappp.DAOObjects.*" %>
<%if(sessionSeller.getSellerID()==0){response.sendRedirect("index.jsp");}%>
<!DOCTYPE html>
<html lang="">
<head>
    <title>Manage Feedback</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" charset="utf-8"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/css/bootstrap.css">
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="navbarcss.css">
    <link rel="stylesheet" href="admin.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.23/css/jquery.dataTables.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.js" charset="utf-8"></script>
    <script src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js" charset="utf-8"></script>
    <script src="sweetalert2.all.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <style>

        .swal2-title {
        position: relative;
        max-width: 100%;
        margin: 0 0 .4em;
        padding: 0;
        color: #fffffff;
        font-size: 1.875em;
        font-weight: 600;
        text-align: center;
        text-transform: none;
        word-wrap: break-word;
    }

    h2 {
        background: #ffffff;
        padding: 20px 35px;
        margin: -10px -50px;
        text-align: center;
        border-radius: 10px 10px 0 0;
    }</style>

</head>
<body>


<%@ include file="navbar.jsp" %>


<div class="container">
    <div class="clearfix">
        <div class="box" style=" width:60px;">
            <h1><i class="fas fa-envelope-open-text"></i></h1>
        </div>
        <div class="box">
            <h1>FEEDBACK</h1>
        </div>
    </div>
        <%
	         ArrayList<Feedback> feedbackOfThisSeller = feedbackDAO.getListOfFeedbackOfThisSeller(sessionSeller.getSellerID());
    %>

    <div class="row justify-content-center">
        <div class="col-auto">
            <table id="table" class=" table table-responsive table-hover table-sm table-bordered">
                <thead class="thead-dark">
                <th scope="col">No.</th>
                <th scope="col">Product Name</th>
                <th scope="col">Username</th>
                <th scope="col">Rating</th>
                <th scope="col">User Feedback</th>
                <th scope="col">Your reply</th>
                <th scope="col">Action</th>
                </thead>
                <tbody>
                <%
                    int bil = 1;
                    if (feedbackOfThisSeller != null) {
                        for (int i = 0; i < feedbackOfThisSeller.size(); i++) {
                %>
                <tr>
                    <th scope="row"><%=bil%> </th>
                    <td><%=productDAO.getProduct(feedbackOfThisSeller.get(i).getFeedbackProductID()).getProductName()%></td>
                    <td><%=customerDAO.getCustomerUsername(feedbackOfThisSeller.get(i).getFeedbackCustomerID())%></td>
                    <td><%=feedbackOfThisSeller.get(i).getFeedbackRating()%></td>
                    <td><%=feedbackOfThisSeller.get(i).getFeedbackReview()%></td>
                    <td><%=feedbackOfThisSeller.get(i).getFeedbackCommentBySeller()%></td>
                    <td >
                        <button class='btn btn-primary' type='button'  data-toggle="modal" data-target="#edit-feedback-<%=feedbackOfThisSeller.get(i).getFeedbackID()%>"  name='update' ><i class="far fa-edit"></i></button>
                    </td></tr>

                <%@ include file="modalUpdateFeedback.jsp" %>

                <%
                    bil++;
                    }
                }
                %>
                </tbody>
            </table>
        </div>

    </div><!-- end of feedback video table div -->

    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

    <script type="text/javascript">

        $(document).ready(function () {
            $('#table').DataTable();
        });

        var successfulFeedbackFlag = "<%=request.getParameter("successfulFeedbackFlag")%>";
        if(successfulFeedbackFlag === "successfulFeedback"){
            swal({
                icon: 'success',
                title: 'Successfully updated your comment!',
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
                window.location.replace('Seller_Feedback.jsp');
            });


            <%request.setAttribute("successfulFeedbackFlag",null); %>

        }


    </script>


    <%@ include file="script.jsp"  %>


</body>
</html>

<%@ page import="java.util.ArrayList" %>
<%@ page import="static com.example.omazonwebappp.DAOObjects.sessionSeller" %>
<%@ page import="com.example.omazonwebappp.Transaction" %>
<%
    if (sessionSeller.getSellerID() == 0) {
        response.sendRedirect("index.jsp");
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Manage Payments</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" charset="utf-8"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/css/bootstrap.css">
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="admin.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/js/bootstrap.min.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.23/css/jquery.dataTables.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.js" charset="utf-8"></script>
    <script src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js" charset="utf-8"></script>
    <script src="sweetalert2.all.min.js"></script>
    <!-- Optional: include a polyfill for ES6 Promises for IE11 -->
    <script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>

    <link rel="stylesheet" href="navbarcss.css">

    <?php include 'navbarcss.php'; ?>

</head>
<body>
<%@ include file="navbar.jsp" %>


<div class="container">
    <div class="clearfix">
        <div class="box" style=" width:60px;">
            <h1><i class="fas fa-credit-card"></i></h1>
        </div>
        <div class="box">
            <h1>MANAGE PAYMENT</h1>
        </div>
    </div>
    <div class="row justify-content-center">
        <div class="col-auto">
            <table id="table" class=" table table-responsive table-hover table-sm table-bordered">
                <thead class="thead-dark">
                <tr class="text-center">
                    <th> No</th>
                    <th> Payment ID</th>
                    <th> Payment Date</th>
                    <th> Amount</th>
                </tr>
                </thead>
                <tbody>
                <%
                    int count = 0;
                    ArrayList<Transaction> listOfTransaction = sessionSeller.getSellerTransactions();
                    if (listOfTransaction != null) {
                        for (int i = 0; i < listOfTransaction.size(); i++) {
                %>
                <tr>
                    <td class="text-center"><% count++;%><%=count%>
                    </td>
                    <td class="text-center">TR<%=listOfTransaction.get(i).getTransactionID()%>
                    </td>
                    <td class="text-center"><%=listOfTransaction.get(i).getTransactionDateTime()%>
                    </td>
                    <td> RM <%=listOfTransaction.get(i).getTransactionAmount()%>
                    </td>
                </tr>

                <%
                        }
                    }
                %>

                </tbody>
            </table>
        </div>

        <div>
            <script>
                window.onscroll = function () {
                    myFunction()
                };

                var navbar = document.getElementById("navbar");
                var sticky = navbar.offsetTop;

                function myFunction() {
                    if (window.pageYOffset >= sticky) {
                        navbar.classList.add("sticky")
                    } else {
                        navbar.classList.remove("sticky");
                    }
                }

                /* Loop through all dropdown buttons to toggle between hiding and showing its dropdown content - This allows the user to have multiple dropdowns without any conflict */
                var dropdown = document.getElementsByClassName("dropdown-btn");
                var i;

                for (i = 0; i < dropdown.length; i++) {
                    dropdown[i].addEventListener("click", function () {
                        this.classList.toggle("active");
                        var dropdownContent = this.nextElementSibling;
                        if (dropdownContent.style.display === "block") {
                            dropdownContent.style.display = "none";
                        } else {
                            dropdownContent.style.display = "block";
                        }
                    });
                }

                function openNav() {
                    document.getElementById("mySidebar").style.width = "250px";
                    document.getElementById("main").style.marginLeft = "250px";
                }

                function closeNav() {
                    document.getElementById("mySidebar").style.width = "0";
                    document.getElementById("main").style.marginLeft = "0";
                }


                $(document).ready(function () {
                    $('#table').DataTable();
                });


            </script>
        </div>
    </div>
</div>

</body>
</html>

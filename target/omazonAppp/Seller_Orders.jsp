<%@ page import="java.util.ArrayList" %>
<%@ page import="static com.example.omazonwebappp.DAOObjects.sessionSeller" %>
<%@ page import="com.example.omazonwebappp.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Orders</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="admin.css">
    <link rel="stylesheet" href="navbarcss.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" charset="utf-8"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/css/bootstrap.css">
    </style>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.23/css/jquery.dataTables.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.js" charset="utf-8"></script>
    <script src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js" charset="utf-8"></script>
    <script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

</head>
<body>

<%@ include file="navbar.jsp" %>

<!--main board-->
<div class="container" style="max-width:1400px;">
    <div class="clearfix">
        <div class="box" style=" width:60px;">
            <h1><i class="fas fa-shopping-cart"></i></h1>
        </div>
        <div class="box">
            <h1>ORDER</h1>
        </div>
    </div>
    <table id="table" class=" table table-responsive table-hover table-sm table-bordered">
        <thead class="thead-dark">
        <tr class="text-center">
            <th> No</th>
            <th> Order ID</th>
            <tH> Ordered Date</tH>
            <tH> Status</tH>
            <tH> Tracking Number</tH>
            <tH> Details</tH>
            <tH> Edit</tH>

        </tr>
        </thead>
        <tbody>

        <%
            int count = 0;
            OrdersDao ordersDAO = new OrdersDaoImp();
            ArrayList<Orders> listOfOrders = ordersDAO.getListOfOrdersOfSeller(sessionSeller.getSellerID());
            CustomerDao customerDAO = new CustomerDaoImp();

            String rowcolour;
            if (listOfOrders != null) {

                for (int i = 0; i < listOfOrders.size(); i++) {

                    int orderID = listOfOrders.get(i).getOrderID();

                    if (Objects.equals(listOfOrders.get(i).getOrderStatus(), "Unprocessed"))
                        rowcolour = "table-danger";
                    else if (Objects.equals(listOfOrders.get(i).getOrderStatus(), "Processing"))
                        rowcolour = "table-warning";
                    else
                        rowcolour = "table-success";
        %>

        <tr class="<%=rowcolour%>">
            <td class="text-center"><% count++;%> <%=count%>
            </td>
            <td class="text-center"> OD<%=listOfOrders.get(i).getOrderID()%>
            </td>
            <td><%=listOfOrders.get(i).getOrderDate()%>
            </td>
            <td><%=listOfOrders.get(i).getOrderStatus()%>
            </td>
            <td><%=listOfOrders.get(i).getOrderTrackingID()%>
            </td>
            <td style="width:200px">
                <button class='btn btn-primary' type='button' value="<%=orderID%>"
                        onclick="window.location.href='Seller_Order_Detail.jsp?orderID=<%=orderID%>'" name='detailbtn'>
                    DETAILS
                </button>
            </td>
            <td>
                <button class='btn btn-primary' type='button' data-toggle="modal" data-target="#edit-order-<%=orderID%>"
                        name='update'><i class="far fa-edit"></i></button>
            </td>
        </tr>
        <%@ include file="modalord.jsp" %>

        <%
            }
        } else {
        %>
        </tbody>
    </table>
</div>

        <%
            }
        %>


<%@ include file="script.jsp" %>

<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

<script>
    $(document).ready(function () {
        $('#table').DataTable();
    });


    var successfulOrderUpdateFlag = "<%=request.getParameter("successfulOrderUpdateFlag")%>";
    if (successfulOrderUpdateFlag === "successfulOrderUpdate") {
        swal({
            icon: 'success',
            title: 'Successfully updated your order !',
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
            window.location.replace('Seller_Orders.jsp');
        });


        <%request.setAttribute("successfulOrderUpdateFlag",null); %>

    }

</script>
</body>
</html>

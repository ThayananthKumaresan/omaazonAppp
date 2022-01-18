<%@ page import="static com.example.omazonwebappp.DAOObjects.sessionSeller" %>
<%@ page import="com.example.omazonwebappp.*" %>
<%@ page import="static com.example.omazonwebappp.DAOObjects.ordersDAO" %>
<%@ page import="static com.example.omazonwebappp.DAOObjects.*" %>
<%
    if (sessionSeller.getSellerID() == 0) {
        response.sendRedirect("index.jsp");
    }
%>
<% int orderID = Integer.parseInt(request.getParameter("orderID"));
%>
<!DOCTYPE html>
<html>
<head>
    <title>Orders Detail</title>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">


    <style>

        h2 {
            background: #ffffff;
            padding: 20px 35px;
            margin: -10px -50px;
            text-align: center;
            border-radius: 10px 10px 0 0;
        }

        * {
            box-sizing: border-box;
        }

        /* Add a gray background color with some padding */
        body {
            font-family: Arial;
            padding: 20px;
            background: #6F4B79;
        }

        /* Header/Blog Title */
        .header {
            padding: 10px;
            font-size: 40px;
            text-align: center;
            background: white;
        }


        /* Create two unequal columns that floats next to each other */
        /* Left column */
        .leftcolumn {
            float: left;
            width: 75%;
        }

        /* Right column */
        .rightcolumn {
            float: left;
            width: 25%;
            padding-left: 20px;
        }


        /* Add a card effect for articles */
        .card {
            background-color: white;
            padding: 20px;
            margin-top: 20px;
        }

        /* Clear floats after the columns */
        .row:after {
            content: "";
            display: table;
            clear: both;
        }

        .btn {
            width: 100px;
            height: 45px;
            border-radius: 5px;
            background-color: #9b63e4;
            color: #fff;
            font-size: 18px;
            cursor: pointer;
        }


        /* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other */
        @media screen and (max-width: 800px) {
            .leftcolumn, .rightcolumn {
                width: 100%;
                padding: 0;
            }
        }
    </style>
</head>
<body>

<div class="header">
    <h3>OD<%=orderID%>
    </h3>
</div>

<div class="row">
    <div class="leftcolumn">
        <div class="card">
            <h1>PRODUCT ORDERED</h1>
            <table class="order" width="850px">

                <tr>
                    <td colspan="5">
                        <hr>
                    </td>
                </tr>
                <thead>
                <th colspan="2">Product</th>
                <th colspan="1">Quantity</th>
                <th>Price Per Unit</th>
                <th>Total Price</th>
                </thead>


                <%
                    double total = 0;
                    Orders orders = ordersDAO.getOrders(orderID);
                %>
                <tr>
                    <td style="text-align:center">
                        <br> <b><%=productDAO.getProduct(orders.getOrderProductID()).getProductName()%>
                    </b><br><br>
                        <img src="pics/<%=productDAO.getProduct(orders.getOrderProductID()).getProductFilePath()%>"
                             width="100px"/><br><br>
                        <br>
                    </td>
                    <td>
                    <td style="text-align:center"><%=orders.getOrderQuantity()%>
                    </td>
                    </td>
                    <td style="text-align:center">
                        RM <%=df.format(productDAO.getProduct(orders.getOrderProductID()).getProductPrice())%>
                    </td>
                    <td style="text-align:center">
                        RM <%=df.format(productDAO.getProduct(orders.getOrderProductID()).getProductPrice() * orders.getOrderQuantity())%>
                    </td>
                </tr>
                <tr>
                    <td colspan="5">
                        <hr>
                    </td>
                </tr>
                <tr>
                    <td style="text-align:right" colspan="3"></td>
                </tr>

                <%
                    total = total + (productDAO.getProduct(orders.getOrderProductID()).getProductPrice() * orders.getOrderQuantity());
                %>

            </table>
            <h1>TOTAL : RM <%=df.format(total)%>
            </h1>

        </div>


    </div>


    <div class="rightcolumn">
        <div class="card">
            <h3><b>CUSTOMER INFORMATION</b></h3>
            <h3>Name</h3>
            <p><%= customerDAO.getCustomer(orders.getOrderCustomerID()).getFirstName() + " "%><%=customerDAO.getCustomer(orders.getOrderCustomerID()).getFirstName()%>
            </p>
            <h3>Contact Number</h3>
            <p><%= customerDAO.getCustomer(orders.getOrderCustomerID()).getContactNum()%>
            </p>
            <h3>Email</h3>
            <p><%= customerDAO.getCustomer(orders.getOrderCustomerID()).getEmail()%>
            </p>
        </div>
        <div class="card">
            <h3>SHIP TO FOLLOWING ADDRESS</h3>
            <p><%= customerDAO.getCustomer(orders.getOrderCustomerID()).getAddress()%>
            </p>
        </div>
        <div class="card" style="text-align:center; background-color:#6F4B79">
            <button class='btn btn-primary' type='button' onclick="window.location.href='Seller_Orders.jsp'">BACK
            </button>
        </div>
    </div>
</div>

</body>
</html>

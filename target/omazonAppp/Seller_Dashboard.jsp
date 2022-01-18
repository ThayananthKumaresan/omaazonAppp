<%@ page import="com.example.omazonwebappp.*" %>
<%@ page import="static com.example.omazonwebappp.DAOObjects.sessionSeller" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="static com.example.omazonwebappp.DAOObjects.notificationDAO" %>
<%@ page import="static com.example.omazonwebappp.DAOObjects.*" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.Date" %>

<%


    int feedbackOfThisSeller = 0;
    int productsCountOfThisSeller = 0;
    int ordersOfThisSeller = 0;
    int notificationOfThisSeller = 0;

    ArrayList<Product> listOfProductsOfThisSeller = null;

    if (feedbackDAO.getListOfFeedbackOfThisSeller(sessionSeller.getSellerID()) != null) {
        feedbackOfThisSeller = feedbackDAO.getListOfFeedbackOfThisSeller(sessionSeller.getSellerID()).size();
    }

    String[] productNames = null;
    Integer[] productSalesCount = null;

    if (productDAO.getListOfProductsOfThisSeller(sessionSeller.getSellerID()) != null) {

        listOfProductsOfThisSeller = productDAO.getListOfProductsOfThisSeller(sessionSeller.getSellerID());
        productsCountOfThisSeller = productDAO.getListOfProductsOfThisSeller(sessionSeller.getSellerID()).size();
        productNames = new String[productsCountOfThisSeller];
        productSalesCount = new Integer[productsCountOfThisSeller];

        for (int i = 0; i < listOfProductsOfThisSeller.size(); i++) {
            if(listOfProductsOfThisSeller.get(i).getProductSalesCount()>0) {
                productNames[i] = listOfProductsOfThisSeller.get(i).getProductName();
                productSalesCount[i] = listOfProductsOfThisSeller.get(i).getProductSalesCount();
            }
        }

    }

    if (ordersDAO.getListOfOrdersOfSeller(sessionSeller.getSellerID()) != null) {
        ordersOfThisSeller = ordersDAO.getListOfOrdersOfSeller(sessionSeller.getSellerID()).size();
    }

    if (notificationDAO.getListOfNotificationOfSeller(sessionSeller.getSellerID()) != null) {
        notificationOfThisSeller = notificationDAO.getListOfNotificationOfSeller(sessionSeller.getSellerID()).size();
    }


%>


<!DOCTYPE html>
<html lang="en">
<head>
    <title>Dashboard</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
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


<%@ include file="navbar.jsp" %>

<body>

<div class="container">
    <div class="row">
        <!-- Total product data-->
        <div class="col-xl-4 col-sm-6 mb-3">
            <div class="card text-white bg-primary o-hidden h-100">
                <div class="card-body">
                    <div class="card-body-icon">
                        <i class="fa fa-list"></i>
                    </div>
                    <div class="mr-5"><%=productsCountOfThisSeller%> Product!</div>
                </div>
                <a class="card-footer text-white clearfix small z-1" href="Seller_Product.jsp">
                    <!-- product page link-->
                    <span class="float-left">View Products</span>
                    <span class="float-right">
                <i class="fa fa-angle-right"></i>
              </span>
                </a>
            </div>
        </div>

        <!-- total order data-->
        <div class="col-xl-4 col-sm-6 mb-3">
            <div class="card text-white bg-success o-hidden h-100">
                <div class="card-body">
                    <div class="card-body-icon">
                        <i class="fa fa-fw fa-shopping-cart"></i>
                    </div>
                    <div class="mr-5"><%=ordersOfThisSeller%>  Orders!</div>
                </div>
                <a class="card-footer text-white clearfix small z-1" href="Seller_Orders.jsp"><!-- order page link-->
                    <span class="float-left">View Orders</span>
                    <span class="float-right">
                <i class="fa fa-angle-right"></i>
              </span>
                </a>
            </div>
        </div>

        <!-- total feedback data-->
        <div class="col-xl-4 col-sm-6 mb-3">
            <div class="card text-white bg-secondary o-hidden h-100">
                <div class="card-body">
                    <div class="card-body-icon">
                        <i class="fa fa-fw fa-comments"></i>
                    </div>
                    <div class="mr-5"><%=feedbackOfThisSeller%> Feedbacks!</div>
                </div>
                <a class="card-footer text-white clearfix small z-1" href="Seller_Feedback.jsp">
                    <!-- feedback page link-->
                    <span class="float-left">View Feedbacks</span>
                    <span class="float-right">
                <i class="fa fa-angle-right"></i>
              </span>
                </a>
            </div>
        </div>

        <!-- total notification data-->
        <div class="col-xl-4 col-sm-6 mb-3">
            <div class="card text-white bg-info o-hidden h-100">
                <div class="card-body">
                    <div class="card-body-icon">
                        <i class="fa fa-fw fa-bell"></i>
                    </div>
                    <div class="mr-5"><%=notificationOfThisSeller%> Notifications!</div>
                </div>
                <a class="card-footer text-white clearfix small z-1" href="Seller_Notification.jsp">
                    <!-- feedback page link-->
                    <span class="float-left">View Notifications</span>
                    <span class="float-right">
                <i class="fa fa-angle-right"></i>
              </span>
                </a>
            </div>
        </div>


        <!-- total payment data-->
        <div class="col-xl-4 col-sm-6 mb-3">
            <div class="card text-white bg-danger o-hidden h-100">
                <div class="card-body">
                    <div class="card-body-icon">
                        <i class="fa fa-money"></i>
                    </div>
                    <div class="mr-5"> Total Profit RM <%=df.format(sessionSeller.getSellerProfit())%>
                    </div>
                </div>

            </div>
        </div>


    </div>
    <!-- End of Icon Cards-->



    <%

        if(sessionSeller.getSellerProfit()!= 0){



    %>

    <!-- Area Chart Sales-->
    <div class="card mb-3">
        <div class="card-header">
            <i class="fa fa-area-chart"></i> Sales Overview
        </div>
        <div class="card-body">
            <canvas id="overallSalesChart" width="100%" height="30"></canvas>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-8">
            <!-- End of Area Chart-->
        </div>
    </div>



    <!-- Area Chart Sales-->
    <div class="card mb-3">
        <div class="card-header">
            <i class="fa fa-area-chart"></i> Products Sales Overview
        </div>
        <div class="card-body">
            <canvas id="productSalesChart" width="100%" height="30"></canvas>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-8">
            <!-- End of Area Chart-->
        </div>
    </div>


        <%

double month1 =0;
double month2=0;
double month3=0;
double month4=0;
double month5=0;
double month6=0;
double month7=0;
double month8=0;
double month9=0;
double month10=0;
double month11=0;
double month12=0;

String FIND_TRANSACTIONS_BY_YEAR = "SELECT YEAR(transactionDate) as SalesYear, " +
            "MONTH(transactionDate) as SalesMonth, " +
            "SUM(transactionAmount) AS TotalSales " +
            "FROM transaction " +
            "WHERE YEAR(transactionDate)=?" +
            " GROUP BY YEAR(transactionDate), MONTH(transactionDate) ORDER BY YEAR(transactionDate), MONTH(transactionDate)";

            Date d=new Date();
            int year=d.getYear();
            int currentYear=year+1900;


        ResultSet rs = null;
        Connection conn;
        PreparedStatement stmnt;

        try {

            conn = MySQLJDBCUtil.getConnection();
            stmnt = conn.prepareStatement(FIND_TRANSACTIONS_BY_YEAR);

            stmnt.setInt(1, currentYear);
            rs = stmnt.executeQuery(); // Executing the sql query

            while (rs.next())
        {
          if(rs.getInt("SalesMonth") == 1){
           month1 = rs.getDouble("TotalSales");
        }else if(rs.getInt("SalesMonth") == 2){
           month2  = rs.getDouble("TotalSales");
        }else if(rs.getInt("SalesMonth") == 3){
           month3  =rs.getDouble("TotalSales");
        }else if(rs.getInt("SalesMonth") == 4){
           month4  = rs.getDouble("TotalSales");
        }else if(rs.getInt("SalesMonth") == 5){
           month5  = rs.getDouble("TotalSales");
        }else if(rs.getInt("SalesMonth") == 6){
           month6  = rs.getDouble("TotalSales");
        }else if(rs.getInt("SalesMonth") == 7){
           month7  = rs.getDouble("TotalSales");
        }else if(rs.getInt("SalesMonth") == 8){
           month8 = rs.getDouble("TotalSales");
        }else if(rs.getInt("SalesMonth") == 9){
          month9  = rs.getDouble("TotalSales");
        }else if(rs.getInt("SalesMonth") == 10){
           month10  = rs.getDouble("TotalSales");
        }else if(rs.getInt("SalesMonth") == 11){
           month11  = rs.getDouble("TotalSales");
        }else if(rs.getInt("SalesMonth") == 12){
           month12  = rs.getDouble("TotalSales");
        }

        double totalsales= rs.getDouble("TotalSales");
        if( totalsales < rs.getDouble("TotalSales")  )
           { totalsales =  rs.getDouble("TotalSales"); }


   }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            try {
                if (rs != null) rs.close();
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
        }




  %>


    <script>

        const ctx = document.getElementById('overallSalesChart').getContext('2d');
        const overallSalesChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
                datasets: [{
                    label: 'Month',
                    data: [<%=df.format(month1)%>, <%=df.format(month2)%>, <%=df.format(month3)%>, <%=df.format(month4)%>, <%=df.format(month5)%>, <%=df.format(month6)%>, <%=df.format(month7)%>, <%=df.format(month8)%>, <%=df.format(month9)%>, <%=df.format(month10)%>, <%=df.format(month11)%>, <%=df.format(month12)%>],
                    backgroundColor: [
                        'rgba(54, 162, 235, 0.2)'
                    ],
                    borderColor: [
                        'rgba(60, 60, 60, 0.5)'
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });


        const ctx2 = document.getElementById('productSalesChart').getContext('2d');
        const productSalesChart = new Chart(ctx2, {
            type: 'pie',
            data: {
                labels: [<%for(int i = 0; i < productNames.length; i++) { if(productNames[i]!=null){%>'<%=productNames[i]%>', <%}}%>],
                datasets: [{
                    label: 'No of Sales',
                    data: [<%for(int i = 0; i < productSalesCount.length; i++) { if(productSalesCount[i]!=null){%><%=productSalesCount[i]%>, <%}}%>],
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 206, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(153, 102, 255, 0.2)',
                        'rgba(255, 159, 64, 0.2)',
                        'rgba(0,0,0, 0.2)',
                        'rgba(0,0,128, 0.2)',
                        'rgba(0,0,255, 0.2)',
                        'rgba(0,128,0, 0.2)',
                        'rgba(0,255,0, 0.2)',
                        'rgba(255,0,255, 0.2)'
                    ],
                    borderColor: [
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 206, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(153, 102, 255, 0.2)',
                        'rgba(255, 159, 64, 0.2)',
                        'rgba(0,0,0, 0.2)',
                        'rgba(0,0,128, 0.2)',
                        'rgba(0,0,255, 0.2)',
                        'rgba(0,128,0, 0.2)',
                        'rgba(0,255,0, 0.2)',
                        'rgba(255,0,255, 0.2)'
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });


    </script>


    <script>
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


    </script>
    <!--end of dropdown menu script-->
<%


        }
%>

    <%@ include file="script.jsp" %>


</body>
</html>

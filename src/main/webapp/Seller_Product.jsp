<%@ page import="com.example.omazonwebappp.Product" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="static com.example.omazonwebappp.DAOObjects.sessionSeller" %>
<%@ page import="static com.example.omazonwebappp.DAOObjects.productDAO" %>
<%@ page import="static com.example.omazonwebappp.DAOObjects.df" %>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Manage Product</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"> <!-- Icon-->
<script src="https://code.jquery.com/jquery-3.5.1.js" charset="utf-8"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/css/bootstrap.css"></style> <!-- Tables and overall-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/js/bootstrap.min.js"></script> <!--Modal-->


<link rel="stylesheet" href="https://cdn.datatables.net/1.10.23/css/jquery.dataTables.min.css">
<script src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js" charset="utf-8"></script>

  <script src="https://js.pusher.com/7.0/pusher.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="admin.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/css/bootstrap.css"></style>
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

    <link rel="stylesheet" href="navbarcss.css">

<style>

h2 {
    background: #ffffff;
    padding: 20px 35px;
    margin: -10px -50px;
    text-align: center;
    border-radius: 10px 10px 0 0;
}</style>
</head>
<body>

<%@ include file="navbar.jsp"  %>


<script type="text/javascript">
    function ValNumber(){
        var decimal=  /^[-+]?[0-9]+\.[0-9]+$/;
        if(document.addProduct.productPrice.value.match(decimal))
        {
            $("#invalid-feedback").hide();
            return true;
        }
        else
        {
            $("#invalid-feedback").show();
            return false;
        }

    }
</script>
<!-- Modal -->
<div id="addModal" class="modal fade" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
            <h4 class="modal-title">Add Product</h4>
            <button type="button" class="close" data-dismiss="modal" >&times;</button>
        </div>

        <div class="modal-body">
              <form id="add-product" name="addProduct" action="ProductServlet"  method="post"   enctype="multipart/form-data" >

                  <input  type="hidden" name ="mode" id="mode" value="add" >

                             <div class="form-group">
                                  <label >Product Name</label>
                                  <input class="form-control"  required  type="text" name ="productName" id="productName" placeholder ="Product Name" >
                             </div>

                             <div class="form-group">
                                   <label >Category</label>
                                   <select id="productCategory" name="productCategory" class="form-control"  required >
                                            <option >  Select a Category </option>
                                                           <%
                                                               String[] category = new String[]{"Women Clothes", "Men Clothes", "Health & Beauty", "Mobile & Accessories",
                                                                       "Baby & Toys", "Watches", "Home & Living", "Home Appliances", "Women's Bags", "Men's Bags & Wallets",
                                                                       "Muslim Fashion", "Computer & Accessories", "Groceries & Pets", "Sport & Outdoor", "Women Shoes",
                                                                       "Men Shoes", "Fashion Accessories", "Games, Books & Hobbies", "Automotive", "Tickets & Vouchers"};
                                                               for (int i = 0; i < category.length; i++) {
                                                           %>
                                            <option value="<%=category[i]%>"><%=category[i]%></option>
                                                           <%
                                                               }
                                                           %>
                                   </select>
                             </div>
                                                   <div class="form-group">
                                                   <label> Price</label>
                                                   <input class="form-control" onmouseout="ValNumber()" required  type="text" name="productPrice" id="productPrice"  placeholder ="Product Price" >
                                                       <div style="display: none; color:red; font-weight: bold" id="invalid-feedback">Please enter correct format (XX.XX). Eg : 10.00 </div>
                                                   </div>

                                                   <div class="form-group">
                                                   <label>Description</label>
                                                   <input class="form-control"  required  type="text" name="productDescription" id="productDescription"  placeholder ="Product Description" >
                                                   </div>

                                                   <div class="form-group">
                                                   <label >Product Image</label>
                                                   <input class="form-control"  required  type="file"  name="productImage"  id="productImage" accept="image/*" >
                                                   </div>

                            <div class="form-group">
                              <label>Stock Count</label>
                              <input class="form-control"  required  type="number" id="productStock"  name="productStock"  placeholder ="Product Stock" >
                            </div>
                      <button  class="btn btn-primary" type="submit" name="addproduct" >ADD</button>
                  </form>
                </div>

           <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal" >Close</button>
           </div>
      </div>
    </div>
</div>





<div class="container">
        <div class="clearfix">
            <div class="box" style=" width:60px;">
                <h1><i class="fas fa-clipboard-list"></i></h1>
            </div>
            <div class="box">
                <h1>MANAGE PRODUCT</h1>
            </div>
        </div>
        <button type="button" id="popup" data-toggle="modal"  data-target="#addModal">ADD</button>

        <div class="table">
            <table id="table" class="table table-responsive table-hover table-sm table-bordered">
                <thead class="thead-dark">
                      <th scope="col">No.</th>
                      <th scope="col">Product ID</th>
                      <th scope="col">Name</th>
                      <th scope="col">Image</th>
                      <th scope="col">Category</th>
                      <th scope="col">Description</th>
                      <th scope="col">Price</th>
                      <th scope="col">Stock</th>
                      <th scope="col">Sales</th>
                      <th scope="col">Edit</th>
                      <th scope="col">Delete</th>
                </thead>
        <tbody>
        <%
            int bill=1;
                ArrayList<Product> listOfProductOfThisSeller = productDAO.getListOfProductsOfThisSeller(sessionSeller.getSellerID());
                if( listOfProductOfThisSeller!= null){
                    for (Product product : listOfProductOfThisSeller) {
        %>
          <tr>
              <th scope="row"><%=bill%></th>
              <td >P<%=product.getProductID()%></td>
              <td ><%=product.getProductName()%></td>
              <td ><img src="pics/<%=product.getProductFilePath()%>" width="100px" class="img-fluid"> </td>
              <td ><%=product.getProductCategory()%></td>
              <td ><%=product.getProductDescription()%></td>
              <td >RM <%=df.format(product.getProductPrice())%></td>
              <td ><%=product.getProductStockCount()%></td>
              <td >RM <%=df.format(product.getProductSalesCount()* product.getProductPrice())%></td>
              <td> <button type="button"  class=" btn btn-info EDIT" name="button" data-toggle="modal" data-target="#editModal<%=product.getProductID()%>" > <i class="far fa-edit"></i> </button> </td>
              <td>
                      <form  id="delete-product-<%=product.getProductID()%>" action="ProductServlet" method="post"  novalidate>
                          <input type="hidden" name="productIDToDelete" value="<%=product.getProductID()%>">
                          <button type="submit"  id="deletebutton" class=" btn btn-danger delete"  value="<%=product.getProductID()%>" name="dltbtn"><i class="fas fa-trash"></i></button>
                      </form>
              </td>
          </tr>

        <%bill++;%>

        <%@ include file="modaledit.jsp" %>
        <%
            }
        }
        %>
        </tbody>
        </table>
        </div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>


<script type="text/javascript">



    $(document).ready(function() {
            $('#table').DataTable();
        } );

    $ (document).ready (function (e) {

    $ ("#add-product").on ("submit", function (event) {

        event.preventDefault ();

        let f = new FormData(this);

        $. ajax ({
            url: "ProductServlet",
            type: 'POST',
            data: f,
            success : function (data ,textStatus,jqXHR){
                console.log(data);
                 if(data.trim() == 'unsuccessful')
                     swal('Oops an error occured!', 'Unable to add product', 'error');
                 else
                 {
                     swal({
                         icon: 'success',
                         title: 'Succesfully added product!',
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
                         window.location.replace('Seller_Product.jsp');
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
})

</script>


    <%@ include file="script.jsp"  %>



</div>

</body>
</html>

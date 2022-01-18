
<!-- Modal -->
  <div id="editModal<%=product.getProductID()%>" class="modal fade" role="dialog">
    <div class="modal-dialog">

      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">Update Product</h4>
          <button type="button" class="close" data-dismiss="modal" onclick="window.location.href='Seller_Product.jsp'">&times;</button>
        </div>
        <div class="modal-body">

          <form  id="edit-product-<%=product.getProductID()%>" action="ProductServlet" method="post" class="needs-validation" enctype="multipart/form-data" novalidate>

            <input  type="hidden" name ="mode" id="mode" value="edit" >
            <input type="hidden" name="productID" value="<%=product.getProductID()%>">
            <input type="hidden" name="currentProductImage"  value="<%=product.getProductFilePath()%>">



                                         <div class="form-group">
                                           <label >Product Name</label>
                                           <input class="form-control"  required  type="text" name="productName" value="<%=product.getProductName()%>">
                                           <div class="valid-feedback">Valid.</div>
                                           <div class="invalid-feedback">Please fill out this field.</div>
                                           </div>

                                           <div class="form-group">
                                           <label >Category</label>
                                           <select name="productCategory" class="form-control"  required  ><!-- form-control Begin -->
                                             <option selected="selected" value="<%=product.getProductCategory()%> "><%=product.getProductCategory()%> </option>

                                             <option >  Select a Category </option>
                                             <%
                                               String[] category_modal = new String[]{"Women Clothes", "Men Clothes", "Health & Beauty", "Mobile & Accessories",
                                                       "Baby & Toys", "Watches", "Home & Living", "Home Appliances", "Women's Bags", "Men's Bags & Wallets",
                                                       "Muslim Fashion", "Computer & Accessories", "Groceries & Pets", "Sport & Outdoor", "Women Shoes",
                                                       "Men Shoes", "Fashion Accessories", "Games, Books & Hobbies", "Automotive", "Tickets & Vouchers"};

                                               for (int i = 0; i < category_modal.length; i++) {

                                             %>
                                             <option value="<%=category_modal[i]%>"><%=category_modal[i]%></option>
                                             <%
                                               }
                                             %>
                                           </select>
                                           <div class="valid-feedback">Valid.</div>
                                           <div class="invalid-feedback">Please fill out this field.</div>
                                           </div>

                                           <div class="form-group">
                                           <label> Price</label>
                                           <input class="form-control"  required value="<%=product.getProductPrice()%>" type="number" name="productPrice" >
                                           <div class="valid-feedback">Valid.</div>
                                           <div class="invalid-feedback">Please fill out this field.</div>
                                           </div>

                                           <div class="form-group">
                                           <label>Description</label>
                                           <input class="form-control"  required  value="<%=product.getProductDescription()%>" type="text" name="productDescription" >
                                           <div class="valid-feedback">Valid.</div>
                                           <div class="invalid-feedback">Please fill out this field.</div>
                                           </div>

                                           <div class="form-group">
                                           <label>Product Image</label>
                                           <input class="form-control" required  type="file"  name="productImage" accept="image/*" >
                                           <div class="valid-feedback">Valid.</div>
                                           <div class="invalid-feedback">Please fill out this field.</div>
                                           </div>

                                          <div class="form-group">
                                            <label>Stock Count</label>
                                            <input class="form-control"  required  type="number" id="productStock"  name="productStock"  placeholder ="Product Stock"  value="<%=product.getProductStockCount()%>">
                                            <div class="valid-feedback">Valid.</div>
                                            <div class="invalid-feedback">Please fill out this field.</div>
                                         </div>

                                         <button  class="btn btn-primary" type="submit" name="update" >Save</button>

                                         </form>

                                     </div>

                                     <div class="modal-footer">
                                       <button type="button" class="btn btn-danger" data-dismiss="modal" onclick="window.location.href='Seller_Product.jsp'" >Close</button>
                                     </div>
</div>

</div>
</div>

<script>

  $ ("#edit-product-<%=product.getProductID()%>").on ("submit", function (event) {

    event.preventDefault ();
    let f = new FormData(this);

    $. ajax ({
      url: "ProductServlet",
      type: 'POST',
      data: f,
      success : function (data ,textStatus,jqXHR){
        console.log("data");
        if(data.trim() == 'unsuccessful')
          swal('Oops an error occurred!', 'Unable to add product', 'error');
        else
        {
          swal({
            icon: 'success',
            title: 'Successfully updated product!',
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

  $ ("#delete-product-<%=product.getProductID()%>").on ("submit", function (event) {

    event.preventDefault ();
    let f = new FormData(this);

    Swal.fire({
      title: 'Are you sure?',
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

        $.ajax({
          type: "POST",
          url: "ProductServlet",
          data:  f,
          success: function(){
          },
          error :function (data ,textStatus,jqXHR){
            console.log(" I have no idea an error happended")
          },
          processData : false,
          contentType:false
        });
        $(this).parent().parent().fadeOut(300, function(){ $(this).remove();});
      }
    })

  })



</script>



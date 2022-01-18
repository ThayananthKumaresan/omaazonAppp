<%@ page import="java.util.Objects" %>

<!-- The Modal -->
        <div class="modal fade" id="edit-order-<%=orderID%>">
        <div class="modal-dialog">
        <div class="modal-content">

        <!-- Modal Header -->
        <div class="modal-header">
        <h4 class="modal-title">Update Order Status & Tracking Number</h4>
        <button type="button" class="close" data-dismiss="modal" >&times;</button>
        </div>

        <!-- Modal body -->
        <div class="modal-body">

          <form id="edit-order-form-<%=orderID%>" class="" action="OrderServlet" method="post">

                            <input type="hidden" name="ordersID" value="<%=orderID%>" >

                              <div class="form-group">
                                <label >Order ID : </label>
                                <input type="text" readonly name="orderID" value="OD<%=orderID%>" class="form-control">
                                <div class="valid-feedback">Valid.</div>
                                <div class="invalid-feedback">Please fill out this field.</div>
                                </div>

                                <div class="form-group">
                                <label >Customer Name : </label>
                                <input type="text" readonly  value="<%=customerDAO.getCustomerFullName(listOfOrders.get(i).getOrderCustomerID())%> " class="form-control">
                                <div class="valid-feedback">Valid.</div>
                                <div class="invalid-feedback">Please fill out this field.</div>
                                </div>

                                <div class="form-group">
                                <label >Ordered Date : </label>
                                <input type="text" readonly  value="<%=listOfOrders.get(i).getOrderDate()%>" class="form-control">
                                <div class="valid-feedback">Valid.</div>
                                <div class="invalid-feedback">Please fill out this field.</div>
                              </div>

                              <div class="form-group">
                              <label >Order Status :</label>
                                  <%
                                      String option2="";
                                      String mode ="";
                                      if (Objects.equals(listOfOrders.get(i).getOrderStatus(), "Delivered"))
                                      {
                                          mode="readOnly";

                                  %>
                                  <input type="text" readonly  value="<%=listOfOrders.get(i).getOrderStatus()%>" class="form-control" >
                                  <%
                                  }else{
                                  %>
                                  <select class="form-control" name="oderStatus" <%=mode%>>
                                    <option selected="selected" value="<%=listOfOrders.get(i).getOrderStatus()%>"><%=listOfOrders.get(i).getOrderStatus()%></option>
                                      <%

                                      if (Objects.equals(listOfOrders.get(i).getOrderStatus(), "Unprocessed"))
                                         {
                                              option2 ="Processing";
                                         }
                                         else  if (Objects.equals(listOfOrders.get(i).getOrderStatus(), "Processing"))
                                         {
                                              option2 ="Unprocessed";
                                          }

                      %>
                                    <option  value="<%=option2%>"><%=option2%></option>
                          </select>
                                  <%
                                  }
                                  %>
                              <div class="valid-feedback">Valid.</div>
                              <div class="invalid-feedback">Please fill out this field.</div>

                              </div>

                                <div class="form-group">
                                <label >Tracking Number :</label>
                                <input type="text" class="form-control" <%=mode%> value="<%=listOfOrders.get(i).getOrderTrackingID()%>"   name="orderTrackingID" required>
                                <div class="valid-feedback">Valid.</div>
                                <div class="invalid-feedback">Please fill out this field.</div>
                                </div>

                                <button type="submit" class="btn btn-primary" name="update" >Update</button>
      </form>

        </div>

        <!-- Modal footer -->
        <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal" name="closebtn" onclick="window.location.href='Seller_Orders.jsp'">Close</button>

        </div>

        </div>
        </div>
</div>



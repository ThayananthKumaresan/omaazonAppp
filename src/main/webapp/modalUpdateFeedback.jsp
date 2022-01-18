
<!-- The Modal -->
<div class="modal fade" id="edit-feedback-<%=feedbackOfThisSeller.get(i).getFeedbackID()%>">
    <div class="modal-dialog">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">Type your reply</h4>
                <button type="button" class="close" data-dismiss="modal" >&times;</button>
            </div>

            <!-- Modal body -->
            <div class="modal-body">

                <form id="edit-feedback-<%=feedbackOfThisSeller.get(i).getFeedbackID()%>"  action="FeedbackServlet" method="post">

                    <input type="hidden" name="feedbackID" value="<%=feedbackOfThisSeller.get(i).getFeedbackID()%>" >

                    <div class="form-group">
                        <label > User Review : </label>
                        <input type="text" readonly  value="<%=feedbackOfThisSeller.get(i).getFeedbackReview()%> " class="form-control">
                        <div class="valid-feedback">Valid.</div>
                        <div class="invalid-feedback">Please fill out this field.</div>
                    </div>


                    <div class="form-group">
                        <label > Your reply : </label>
                        <input type="text" class="form-control"  value="<%= feedbackOfThisSeller.get(i).getFeedbackCommentBySeller()%>"   name="comment" required>
                        <div class="valid-feedback">Valid.</div>
                        <div class="invalid-feedback">Please fill out this field.</div>
                    </div>

                    <button type="submit" class="btn btn-primary" name="update" >Update My Reply</button>
                </form>

            </div>

            <!-- Modal footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal" name="closebtn" >Close</button>

            </div>

        </div>
    </div>
</div>


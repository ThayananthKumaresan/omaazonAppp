package servlet;

import com.example.omazonwebappp.Feedback;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import java.io.IOException;

import static com.example.omazonwebappp.DAOObjects.feedbackDAO;

@WebServlet(name = "FeedbackServlet", value = "/FeedbackServlet")
public class FeedbackServlet extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String comment =  request.getParameter("comment");
        String feedbackID =  request.getParameter("feedbackID");

        Feedback feedbackToUpdate = feedbackDAO.getFeedback(Integer.parseInt(feedbackID));
        feedbackToUpdate.setFeedbackCommentBySeller(comment);
        feedbackDAO.updateFeedback(feedbackToUpdate);

        request.setAttribute("successfulFeedbackFlag", "successfulFeedback");
        response.sendRedirect("Seller_Feedback.jsp?successfulFeedbackFlag=successfulFeedback");
    }
}

package com.example.omazonwebappp;

public class Feedback {

    int feedbackID;
    int feedbackProductID;
    int feedbackRating;
    int feedbackCustomerID;
    String feedbackReview;
    String feedbackCommentBySeller;

    /**
     * Empty Constructor
     */
    public Feedback() {}

    /**
     * Overloaded constructor with 5 parameter
     * @param feedbackProductID
     * @param feedbackReview
     * @param feedbackCommentBySeller
     * @param feedbackCustomerID
     * @param feedbackRating
     */
    public Feedback(int feedbackProductID, String feedbackReview, String feedbackCommentBySeller, int feedbackCustomerID, int feedbackRating) {
        this.feedbackProductID = feedbackProductID;
        this.feedbackReview = feedbackReview;
        this.feedbackCommentBySeller = feedbackCommentBySeller;
        this.feedbackCustomerID = feedbackCustomerID;
        this.feedbackRating = feedbackRating;
    }

    /**
     * Accessor method for all attribute
     */
    public int getFeedbackID() {
        return feedbackID;
    }
    public int getFeedbackProductID() {
        return feedbackProductID;
    }
    public String getFeedbackReview() {
        return feedbackReview;
    }
    public String getFeedbackCommentBySeller() {
        return feedbackCommentBySeller;
    }
    public int getFeedbackCustomerID() {
        return feedbackCustomerID;
    }
    public int getFeedbackRating() {
        return feedbackRating;
    }

    /**
     * Mutator method for all attribute
     */
    public void setFeedbackID(int feedbackID) {
        this.feedbackID = feedbackID;
    }
    public void setFeedbackProductID(int feedbackProductID) {
        this.feedbackProductID = feedbackProductID;
    }
    public void setFeedbackReview(String feedbackReview) {
        this.feedbackReview = feedbackReview;
    }
    public void setFeedbackCommentBySeller(String feedbackCommentBySeller) {
        this.feedbackCommentBySeller = feedbackCommentBySeller;
    }
    public void setFeedbackCustomerID(int feedbackCustomerUserName) {
        this.feedbackCustomerID = feedbackCustomerUserName;
    }
    public void setFeedbackRating(int feedbackRating) {
        this.feedbackRating = feedbackRating;
    }
}

package com.example.omazonwebappp;

import java.util.ArrayList;

public interface NotificationDao {

    public void deleteNotification(int notificationID);
    public void addNotification(Notification notification);
    public ArrayList<Notification> getListOfNotificationOfSeller(int sellerID);


}

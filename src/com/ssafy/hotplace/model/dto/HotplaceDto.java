package com.ssafy.hotplace.model.dto;

import java.util.Date;

public class HotplaceDto {
    private int hotplaceId;
    private String userId;
    private String title;
    private Date visitedDate;
    private int type;
    private String content;
    private double latitude;
    private double longitude;
    private String image;

    public int getHotplaceId() {
        return hotplaceId;
    }

    public void setHotplaceId(int hotplaceId) {
        this.hotplaceId = hotplaceId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Date getVisitedDate() {
        return visitedDate;
    }

    public void setVisitedDate(Date visitedDate) {
        this.visitedDate = visitedDate;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public double getLatitude() {
        return latitude;
    }

    public void setLatitude(double latitude) {
        this.latitude = latitude;
    }

    public double getLongitude() {
        return longitude;
    }

    public void setLongitude(double longitude) {
        this.longitude = longitude;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}

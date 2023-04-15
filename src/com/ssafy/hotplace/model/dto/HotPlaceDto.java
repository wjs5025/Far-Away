package com.ssafy.hotplace.model.dto;

public class HotPlaceDto {
    private int hotPlaceId;
    private String userId;
    private String title;
    private String visitedDate;
    private String type;
    private String content;
    private double latitude;
    private double longitude;
    private String image;

    public int getHotPlaceId() {
        return hotPlaceId;
    }

    public void setHotPlaceId(int hotPlaceId) {
        this.hotPlaceId = hotPlaceId;
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

    public String getVisitedDate() {
        return visitedDate;
    }

    public void setVisitedDate(String visitedDate) {
        this.visitedDate = visitedDate;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
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

    @Override
    public String toString() {
        return "HotPlaceDto{" +
                "hotPlaceId=" + hotPlaceId +
                ", userId='" + userId + '\'' +
                ", title='" + title + '\'' +
                ", visitedDate='" + visitedDate + '\'' +
                ", type='" + type + '\'' +
                ", content='" + content + '\'' +
                ", latitude=" + latitude +
                ", longitude=" + longitude +
                ", image='" + image + '\'' +
                '}';
    }
}

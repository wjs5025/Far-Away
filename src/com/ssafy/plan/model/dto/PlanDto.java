package com.ssafy.plan.model.dto;

import java.util.Arrays;
import java.util.Date;

public class PlanDto {
    private int planId;
    private String userId;
    private String title;
    private String content;
    private int hit;
    private String departureTime;
    private String arrivalTime;
    private String registerTime;
    private String tripCourse;
    private String planCourse;

    public int getPlanId() {
        return planId;
    }

    public void setPlanId(int planId) {
        this.planId = planId;
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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getHit() {
        return hit;
    }

    public void setHit(int hit) {
        this.hit = hit;
    }

    public String getDepartureTime() {
        return departureTime;
    }

    public void setDepartureTime(String departureTime) {
        this.departureTime = departureTime;
    }

    public String getArrivalTime() {
        return arrivalTime;
    }

    public void setArrivalTime(String arrivalTime) {
        this.arrivalTime = arrivalTime;
    }

    public String getRegisterTime() {
        return registerTime;
    }

    public void setRegisterTime(String registerTime) {
        this.registerTime = registerTime;
    }

    public String getTripCourse() {
        return tripCourse;
    }

    public void setTripCourse(String tripCourse) {
        this.tripCourse = tripCourse;
    }

    public String getPlanCourse() {
        return planCourse;
    }

    public void setPlanCourse(int[] planCourse) {
        this.planCourse = Arrays.toString(planCourse);
    }

    @Override
    public String toString() {
        return "PlanDto{" +
                "planId=" + planId +
                ", userId='" + userId + '\'' +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", hit=" + hit +
                ", departureTime='" + departureTime + '\'' +
                ", arrivalTime='" + arrivalTime + '\'' +
                ", registerTime='" + registerTime + '\'' +
                ", tripCourse='" + tripCourse + '\'' +
                ", planCourse='" + planCourse + '\'' +
                '}';
    }
}

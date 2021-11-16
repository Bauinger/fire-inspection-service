package com.example.FireInspectionService.model;

import java.io.Serializable;
import java.time.LocalDateTime;

public class Inspection implements Serializable {

    private int id;
    private String address;
    private String building;
    private String owner;
    private LocalDateTime meeting_start;
    private LocalDateTime meeting_end;
    private String appraiser;
    private String telephone_number_owner;
    private String email_owner;
    private InspectionStatus inspectionStatus;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getBuilding() {
        return building;
    }

    public void setBuilding(String building) {
        this.building = building;
    }

    public String getOwner() {
        return owner;
    }

    public void setOwner(String owner) {
        this.owner = owner;
    }

    public LocalDateTime getMeeting_start() {
        return meeting_start;
    }

    public void setMeeting_start(LocalDateTime meeting_start) {
        this.meeting_start = meeting_start;
    }

    public LocalDateTime getMeeting_end() {
        return meeting_end;
    }

    public void setMeeting_end(LocalDateTime meeting_end) {
        this.meeting_end = meeting_end;
    }

    public String getAppraiser() {
        return appraiser;
    }

    public void setAppraiser(String appraiser) {
        this.appraiser = appraiser;
    }

    public String getTelephone_number_owner() {
        return telephone_number_owner;
    }

    public void setTelephone_number_owner(String telephone_number_owner) {
        this.telephone_number_owner = telephone_number_owner;
    }

    public String getEmail_owner() {
        return email_owner;
    }

    public void setEmail_owner(String email_owner) {
        this.email_owner = email_owner;
    }

    public InspectionStatus getInspectionStatus() {
        return inspectionStatus;
    }

    public void setInspectionStatus(InspectionStatus inspectionStatus) {
        this.inspectionStatus = inspectionStatus;
    }

    @Override
    public String toString() {
        return "Inspection{" +
                "id=" + id +
                ", address='" + address + '\'' +
                ", building='" + building + '\'' +
                ", owner='" + owner + '\'' +
                ", meeting_start=" + meeting_start +
                ", meeting_end=" + meeting_end +
                ", appraiser='" + appraiser + '\'' +
                ", telephone_number_owner='" + telephone_number_owner + '\'' +
                ", email_owner='" + email_owner + '\'' +
                ", inspectionStatus=" + inspectionStatus +
                '}';
    }
}

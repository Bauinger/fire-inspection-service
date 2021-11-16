package com.example.FireInspectionService.database;

import com.example.FireInspectionService.model.Inspection;
import com.example.FireInspectionService.model.InspectionStatus;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class InspectionDaoImplementation {

    static Connection con = DatabaseConnection.getConnection();

    public static int add(Inspection inspection) throws SQLException {
        String query = "insert into inspections(address, building, owner, meeting_start,"
                     + "meeting_end, appraiser, telephone_number_owner, email_owner, meeting_status)"
                     + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, inspection.getAddress());
        ps.setString(2, inspection.getBuilding());
        ps.setString(3, inspection.getOwner());
        ps.setObject(4, inspection.getMeeting_start());
        ps.setObject(5, inspection.getMeeting_end());
        ps.setString(3, inspection.getAppraiser());
        ps.setString(3, inspection.getTelephone_number_owner());
        ps.setString(3, inspection.getEmail_owner());
        ps.setString(3, inspection.getInspectionStatus().toString());
        int n = ps.executeUpdate();
        return n;
    }

    public static void delete(int id) throws SQLException {
        String query = "delete from inspections where id = ?";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setInt(1, id);
        ps.executeUpdate();
    }

    public static Inspection getInspection(int id) throws SQLException {
        String query = "select * from inspections where id = ?";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setInt(1, id);
        Inspection inspection = new Inspection();
        ResultSet rs = ps.executeQuery();
        boolean check = false;
        while (rs.next()) {
            check = true;
            inspection.setId(rs.getInt("id"));
            inspection.setAddress(rs.getString("address"));
            inspection.setBuilding(rs.getString("building"));
            inspection.setOwner(rs.getString("owner"));
            inspection.setMeeting_start(rs.getObject("meeting_start", LocalDateTime.class));
            inspection.setMeeting_end(rs.getObject("meeting_end", LocalDateTime.class));
            inspection.setAppraiser(rs.getString("appraiser"));
            inspection.setTelephone_number_owner(rs.getString("telephone_number_owner"));
            inspection.setEmail_owner(rs.getString("email_owner"));
            switch(rs.getString("meeting_status")) {
                case "pending":
                    inspection.setInspectionStatus(InspectionStatus.pending);
                    break;
                case "canceled":
                    inspection.setInspectionStatus(InspectionStatus.canceled);
                    break;
                case "completed":
                    inspection.setInspectionStatus(InspectionStatus.completed);
                    break;
            }
        }
        if (check) {
            return inspection;
        } else {
            return null;
        }
    }

    public static List<Inspection> getInspections() throws SQLException {
        String query = "select * from inspections";
        PreparedStatement ps = con.prepareStatement(query);
        ResultSet rs = ps.executeQuery();
        List<Inspection> ls = new ArrayList();

        while (rs.next()) {
            Inspection inspection = new Inspection();
            inspection.setId(rs.getInt("id"));
            inspection.setAddress(rs.getString("address"));
            inspection.setBuilding(rs.getString("building"));
            inspection.setOwner(rs.getString("owner"));
            inspection.setMeeting_start(rs.getObject("meeting_start", LocalDateTime.class));
            inspection.setMeeting_end(rs.getObject("meeting_end", LocalDateTime.class));
            inspection.setAppraiser(rs.getString("appraiser"));
            inspection.setTelephone_number_owner(rs.getString("telephone_number_owner"));
            inspection.setEmail_owner(rs.getString("email_owner"));
            switch(rs.getString("meeting_status")) {
                case "pending":
                    inspection.setInspectionStatus(InspectionStatus.pending);
                    break;
                case "canceled":
                    inspection.setInspectionStatus(InspectionStatus.canceled);
                    break;
                case "completed":
                    inspection.setInspectionStatus(InspectionStatus.completed);
                    break;
            }
            ls.add(inspection);
        }
        return ls;
    }

    public static void update(Inspection inspection) throws SQLException {
        String query = "update inspections set "
                     + "address = ?, building = ?, owner = ?, meeting_start = ?,"
                     + "meeting_end = ?, appraiser = ?, telephone_number_owner = ?,"
                     + "email_owner = ?, meeting_status = ?"
                     + " where id = ?";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, inspection.getAddress());
        ps.setString(2, inspection.getBuilding());
        ps.setString(3, inspection.getOwner());
        ps.setObject(4, inspection.getMeeting_start());
        ps.setObject(5, inspection.getMeeting_end());
        ps.setString(6, inspection.getAppraiser());
        ps.setString(7, inspection.getTelephone_number_owner());
        ps.setString(8, inspection.getEmail_owner());
        ps.setString(9, inspection.getInspectionStatus().toString());
        ps.setInt(10, inspection.getId());
        ps.executeUpdate();
    }
}

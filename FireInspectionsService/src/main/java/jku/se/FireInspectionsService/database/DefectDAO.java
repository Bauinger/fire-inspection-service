package jku.se.FireInspectionsService.database;

import jku.se.FireInspectionsService.model.Defect;
import jku.se.FireInspectionsService.model.DefectPriority;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DefectDAO {

    static Connection con = DatabaseConnection.getConnection();

    public static int add(Defect defect) throws SQLException {
        String query = "insert into defects(defect, meeting_status, inspection_id) VALUES (?, ?, ?)";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, defect.getDefect());
        ps.setString(2, defect.getPriority().toString());
        ps.setInt(3, defect.getInspection_id());
        return ps.executeUpdate();
    }

    public static void delete(int id) throws SQLException {
        String query = "delete from defects where id = ?";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setInt(1, id);
        ps.executeUpdate();
    }

    public static Defect getDefect(int id) throws SQLException {
        String query = "select * from defects where id = ?";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setInt(1, id);
        Defect defect = new Defect();
        ResultSet rs = ps.executeQuery();
        boolean check = false;
        while (rs.next()) {
            check = true;
            defect.setId(rs.getInt("id"));
            defect.setDefect(rs.getString("defect"));
            switch(rs.getString("meeting_status")) {
                case "critical":
                    defect.setPriority(DefectPriority.critical);
                    break;
                case "high":
                    defect.setPriority(DefectPriority.high);
                    break;
                case "normal":
                    defect.setPriority(DefectPriority.normal);
                    break;
                case "low":
                    defect.setPriority(DefectPriority.low);
                    break;
            }
            defect.setInspection_id(rs.getInt("inspection_id"));
        }
        if (check) {
            return defect;
        } else {
            return null;
        }
    }

    public static List<Defect> getDefectsByInspectionId(int id) throws SQLException {
        String query = "select * from defects where inspection_id = ?";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        List<Defect> ls = new ArrayList();

        while (rs.next()) {
            Defect defect = new Defect();
            defect.setId(rs.getInt("id"));
            defect.setDefect(rs.getString("defect"));
            switch(rs.getString("meeting_status")) {
                case "critical":
                    defect.setPriority(DefectPriority.critical);
                    break;
                case "high":
                    defect.setPriority(DefectPriority.high);
                    break;
                case "normal":
                    defect.setPriority(DefectPriority.normal);
                    break;
                case "low":
                    defect.setPriority(DefectPriority.low);
                    break;
            }
            defect.setInspection_id(rs.getInt("inspection_id"));
            ls.add(defect);
        }
        return ls;
    }

    public static void update(Defect defect) throws SQLException {
        String query = "update defects set "
                + "id = ?, defect = ?, meeting_status = ?,"
                + "inspection_id = ? where id = ?";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setInt(1, defect.getId());
        ps.setString(2, defect.getDefect());
        ps.setString(3, defect.getPriority().toString());
        ps.setInt(4, defect.getInspection_id());
        ps.setInt(5, defect.getId());
        ps.executeUpdate();
    }
}

package jku.se.FireInspectionsService.controller;

import jku.se.FireInspectionsService.database.InspectionDAO;
import jku.se.FireInspectionsService.model.Inspection;
import jku.se.FireInspectionsService.model.InspectionStatus;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDateTime;

@WebServlet(name = "inspectionsServlet", value ="/inspections-servlet")
public class InspectionsServlet extends HttpServlet {
    @Override
    public void init() throws ServletException {
        super.init();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        Inspection newInspection = new Inspection();
        boolean isNewInspection = false;
        String idString = request.getParameter("id");
        int id = 0;
        if (idString == null || idString.equals("0")) {
            isNewInspection = true;
        } else {
            id = Integer.parseInt((request.getParameter("id")));
            newInspection.setId(id);
        }

        String address = request.getParameter("address");
        String building = request.getParameter("building");
        String owner = request.getParameter("customer_name");
        LocalDateTime meeting_start = LocalDateTime.parse(request.getParameter("start"));
        LocalDateTime meeting_end = LocalDateTime.parse(request.getParameter("end"));
        String appraiser = request.getParameter("appraiser");
        String telephone_number_owner = request.getParameter("telephone_number_owner");
        String email_owner = request.getParameter("email_owner");
        InspectionStatus inspectionStatus = InspectionStatus.valueOf(request.getParameter("meeting_status"));

        newInspection.setAddress(address);
        newInspection.setBuilding(building);
        newInspection.setOwner(owner);
        newInspection.setMeeting_start(meeting_start);
        newInspection.setMeeting_end(meeting_end);
        newInspection.setAppraiser(appraiser);
        newInspection.setTelephone_number_owner(telephone_number_owner);
        newInspection.setEmail_owner(email_owner);
        newInspection.setInspectionStatus(inspectionStatus);
        try {
            response.setContentType("text/html");
            response.setCharacterEncoding("UTF-8");
            if(isNewInspection) {
                InspectionDAO.add(newInspection);
                request.getRequestDispatcher("index.jsp").include(request, response);
            } else {
                InspectionDAO.update(newInspection);
                request.getRequestDispatcher("edit_inspection.jsp?id=" + id).include(request, response);
            }
        } catch (SQLException | ServletException | IOException throwables) {
            throwables.printStackTrace();
        }
    }

    public void destroy() {
    }
}

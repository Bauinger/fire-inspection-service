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

@WebServlet(name = "deleteInspectionsServlet", value ="/delete-inspections-servlet")
public class DeleteInspectionServlet extends HttpServlet {
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
        id = Integer.parseInt((request.getParameter("id")));
        if(idString != null && !idString.equals("0")) {
            try {
                response.setContentType("text/html");
                response.setCharacterEncoding("UTF-8");
                InspectionDAO.delete(id);
                request.getRequestDispatcher("index.jsp").include(request, response);
            } catch (SQLException | ServletException | IOException throwables) {
                throwables.printStackTrace();
            }
        }

    }

    public void destroy() {
    }
}

package jku.se.FireInspectionsService.controller;

import jku.se.FireInspectionsService.database.DefectDAO;
import jku.se.FireInspectionsService.model.Defect;
import jku.se.FireInspectionsService.model.DefectPriority;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet(name = "defectServlet", value ="/defect-servlet")
public class DefectServlet extends HttpServlet {
    @Override
    public void init() throws ServletException {
        super.init();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        Defect newDefect = new Defect();
        String inspectionId = request.getParameter("inspectionId");
        String description = request.getParameter("defect");
        DefectPriority defectPriority = DefectPriority.valueOf(request.getParameter("priority"));
        newDefect.setInspection_id(Integer.parseInt((inspectionId)));
        newDefect.setDefect(description);
        newDefect.setPriority(defectPriority);
        try {
            DefectDAO.add(newDefect);
            response.setContentType("text/html");
            response.setCharacterEncoding("UTF-8");
;           request.getRequestDispatcher("index.jsp").include(request, response);
        } catch (SQLException | IOException | ServletException throwables) {
            throwables.printStackTrace();
        }
    }

    public void destroy() {
    }
}

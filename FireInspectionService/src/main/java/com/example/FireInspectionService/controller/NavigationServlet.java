package com.example.FireInspectionService.controller;

import com.example.FireInspectionService.database.InspectionDaoImplementation;
import com.example.FireInspectionService.model.Inspection;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@WebServlet(name = "NavigationServlet", value = "/navigation-servlet")
public class NavigationServlet extends HttpServlet {

    private InspectionDaoImplementation inspectionDaoImplementation;

    public void init() {
        inspectionDaoImplementation = new InspectionDaoImplementation();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) {
        String param = request.getParameter("site");
    }

    public void destroy() {
    }
}

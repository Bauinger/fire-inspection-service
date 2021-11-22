<%@ page import="java.sql.SQLException" %>
<%@ page import="jku.se.FireInspectionsService.database.InspectionDAO" %>
<%@ page import="jku.se.FireInspectionsService.model.Inspection" %>
<%@ page import="java.util.List" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="de">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Feuerpolizeiliche Beschau">
    <meta name="author" content="Bernhard Auinger">
    <title>Feuerpolizeiliche Beschau | Übersicht</title>
    <link href="assets/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }
    </style>
    <link href="dashboard.css" rel="stylesheet">
</head>
<body>

<header class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">
    <a class="navbar-brand col-md-3 col-lg-2 me-0 px-3" href="index.jsp">Feuerpolizeiliche Beschau</a>
    <button class="navbar-toggler position-absolute d-md-none collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
</header>

<div class="container-fluid">
    <div class="row">
        <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
            <div class="position-sticky pt-3">
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="index.jsp">
                            <span data-feather="home"></span>
                            Übersicht
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="edit_inspection.jsp">
                            <span data-feather="plus-circle"></span>
                            Neuen Termin erstellen
                        </a>
                    </li>
                </ul>
            </div>
        </nav>

        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h1 class="h2">Terminübersicht</h1>
            </div>
            <div class="table-responsive">
                <table class="table align-middle table-striped text-center table-sm">
                    <thead>
                    <tr>
                        <th scope="col">Prüfer</th>
                        <th scope="col">Eigentümer</th>
                        <th scope="col">Adresse</th>
                        <th scope="col">Gebäude</th>
                        <th scope="col">Start</th>
                        <th scope="col">Ende</th>
                        <th scope="col">Status</th>
                        <th scope="col">Telefon</th>
                        <th scope="col">E-Mail</th>
                        <th scope="col">Bearbeiten</th>
                        <th scope="col">Löschen</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        List<Inspection> list = null;
                        try {
                            list = InspectionDAO.getInspections();
                        } catch (SQLException throwables) {
                            throwables.printStackTrace();
                        }
                        if(list != null && (!list.isEmpty())) {
                            for (Inspection inspection: list) {
                    %>
                    <tr>
                        <td><%=inspection.getAppraiser()%></td>
                        <td><%=inspection.getOwner()%></td>
                        <td><%=inspection.getAddress()%></td>
                        <td><%=inspection.getBuilding()%></td>
                        <td><%=inspection.getMeeting_start().format(DateTimeFormatter.ofPattern("HH:mm dd.MM.yyyy"))%></td>
                        <td><%=inspection.getMeeting_end().format(DateTimeFormatter.ofPattern("HH:mm dd.MM.yyyy"))%></td>
                        <td>
                            <span style="text-color: <%=inspection.getInspectionStatus().color%>">
                                <%=inspection.getInspectionStatus().label%>
                            </span>
                        </td>
                        <td><%=inspection.getTelephone_number_owner()%></td>
                        <td><%=inspection.getEmail_owner()%></td>
                        <td>
                          <a href="edit_inspection.jsp?id=<%= inspection.getId() %>">
                              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pen" viewBox="0 0 16 16">
                                  <path d="m13.498.795.149-.149a1.207 1.207 0 1 1 1.707 1.708l-.149.148a1.5 1.5 0 0 1-.059 2.059L4.854 14.854a.5.5 0 0 1-.233.131l-4 1a.5.5 0 0 1-.606-.606l1-4a.5.5 0 0 1 .131-.232l9.642-9.642a.5.5 0 0 0-.642.056L6.854 4.854a.5.5 0 1 1-.708-.708L9.44.854A1.5 1.5 0 0 1 11.5.796a1.5 1.5 0 0 1 1.998-.001zm-.644.766a.5.5 0 0 0-.707 0L1.95 11.756l-.764 3.057 3.057-.764L14.44 3.854a.5.5 0 0 0 0-.708l-1.585-1.585z"></path>
                              </svg>
                          </a>
                        </td>
                        <td>
                            <form method="post" action="delete-inspections-servlet" class="needs-validation" novalidate>
                                <input hidden type="number" name="id" id="id" value="<% out.print(inspection.getId());  %>" >
                                <button type="submit" style="background-color: transparent; border: transparent;">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-clipboard-x" viewBox="0 0 16 16">
                                        <path fill-rule="evenodd" d="M6.146 7.146a.5.5 0 0 1 .708 0L8 8.293l1.146-1.147a.5.5 0 1 1 .708.708L8.707 9l1.147 1.146a.5.5 0 0 1-.708.708L8 9.707l-1.146 1.147a.5.5 0 0 1-.708-.708L7.293 9 6.146 7.854a.5.5 0 0 1 0-.708z"></path>
                                        <path d="M4 1.5H3a2 2 0 0 0-2 2V14a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V3.5a2 2 0 0 0-2-2h-1v1h1a1 1 0 0 1 1 1V14a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V3.5a1 1 0 0 1 1-1h1v-1z"></path>
                                        <path d="M9.5 1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5v-1a.5.5 0 0 1 .5-.5h3zm-3-1A1.5 1.5 0 0 0 5 1.5v1A1.5 1.5 0 0 0 6.5 4h3A1.5 1.5 0 0 0 11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3z"></path>
                                    </svg>
                                </button>
                            </form>

                        </td>
                    </tr>
                    <%
                        }
                    } else {
                    %>
                    <div>Es wurden noch keine Termine hinzugefügt</div>
                    <%
                        }
                    %>
                    </tbody>
                </table>
            </div>
        </main>
    </div>
</div>


<script src="assets/dist/js/bootstrap.bundle.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js" integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE" crossorigin="anonymous"></script><script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js" integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha" crossorigin="anonymous"></script><script src="dashboard.js"></script>
</body>
</html>
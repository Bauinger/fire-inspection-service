<%@ page import="java.sql.SQLException" %>
<%@ page import="jku.se.FireInspectionsService.database.InspectionDAO" %>
<%@ page import="jku.se.FireInspectionsService.model.Inspection" %>
<%@ page import="java.util.List" %>
<%@ page import="jku.se.FireInspectionsService.database.DefectDAO" %>
<%@ page import="jku.se.FireInspectionsService.model.Defect" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="jku.se.FireInspectionsService.model.InspectionStatus" %>
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
                        <a class="nav-link" aria-current="page" href="index.jsp">
                            <span data-feather="home"></span>
                            Übersicht
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="edit_inspection.jsp">
                            <span data-feather="plus-circle"></span>
                            Neuen Termin erstellen
                        </a>
                    </li>
                </ul>
            </div>
        </nav>

        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
            <div class="d-flex mb-5 justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h1 class="h2">Details</h1>
            </div>
            <div class="col-md-7 col-lg-8">
                <%
                    int id = request.getParameter("id") != null ? Integer.parseInt(request.getParameter("id")) : -1;
                    List<Defect> defects = null;
                    Inspection inspection = null;
                    if(id != -1) {
                        try {
                            defects = DefectDAO.getDefectsByInspectionId(id);
                            inspection = InspectionDAO.getInspection(id);
                        } catch (SQLException throwables) {
                            throwables.printStackTrace();
                        }
                    } else {
                        defects = new ArrayList<>();
                        inspection = new Inspection();
                    }
                %>
                <form method="post" action="inspections-servlet" class="needs-validation" novalidate>

                    <h4 class="mb-3">Kundendetails</h4>

                    <div class="row g-3">
                            <input hidden type="number" name="id" id="id" value="<%if(!(inspection == null)) { out.print(inspection.getId()); } %>" >
                            <div class="col-12">
                                <label for="customer_name" class="form-label">Name</label>
                                <input type="text" class="form-control" id="customer_name" name="customer_name" placeholder="Max Mustermann" value="<%if(!(inspection == null || inspection.getOwner() == null)) { out.print(inspection.getOwner()); } %>" required>
                                <div class="invalid-feedback">
                                    Der Eigentümername ist verpflichtend!
                                </div>
                            </div>

                            <div class="col-12">
                                <label for="address" class="form-label">Adresse</label>
                                <input type="text" class="form-control" id="address" name="address" placeholder="Musterstraße 1, 1000 Musterstadt" value="<%if(!(inspection == null || inspection.getAddress() == null)) { out.print(inspection.getAddress()); } %>" required>
                                <div class="invalid-feedback">
                                    Die Adresse ist verpflichtend!
                                </div>
                            </div>

                            <div class="col-12">
                                <label for="building" class="form-label">Gebäude</label>
                                <input type="text" class="form-control" id="building" name="building" placeholder="HG" value="<%if(!(inspection == null || inspection.getBuilding() == null)) { out.print(inspection.getBuilding()); } %>" required>
                                <div class="invalid-feedback">
                                    Das Gebäude ist verpflichtend!
                                </div>
                            </div>

                            <div class="col-12">
                                <label for="telephone_number_owner" class="form-label">Telefonnummer</label>
                                <input type="tel" class="form-control" id="telephone_number_owner" name="telephone_number_owner" placeholder="0664 00001111" value="<%if(!(inspection == null || inspection.getTelephone_number_owner() == null)) { out.print(inspection.getTelephone_number_owner()); } %>" required>
                                <div class="invalid-feedback">
                                    Die Telefonnummer ist verpflichtend!
                                </div>
                            </div>

                            <div class="col-12">
                                <label for="email_owner" class="form-label">E-Mail</label>
                                <input type="email" class="form-control" id="email_owner" name="email_owner" placeholder="max@mustermann.at" value="<%if(!(inspection == null || inspection.getEmail_owner() == null)) { out.print(inspection.getEmail_owner()); } %>" required>
                                <div class="invalid-feedback">
                                    Die E-Mail ist verpflichtend!
                                </div>
                            </div>

                    <h4 class="mb-3">Termindetails</h4>

                            <div class="col-12">
                                <label for="appraiser" class="form-label">Abnehmer</label>
                                <input type="text" class="form-control" id="appraiser" name="appraiser" placeholder="Max Mustermann" value="<%if(!(inspection == null || inspection.getAppraiser() == null)) { out.print(inspection.getAppraiser()); } %>" required>
                                <div class="invalid-feedback">
                                    Der Abnehmername ist verpflichtend!
                                </div>
                            </div>

                            <div class="col-12">
                                <label for="start" class="form-label">Start des Termins</label>
                                <input type="datetime-local" class="form-control" id="start" name="start" value="<%if(!(inspection == null || inspection.getMeeting_start() == null)) { out.print(inspection.getMeeting_start()); } %>" required>
                                <div class="invalid-feedback">
                                    Der Starttermin ist verpflichtend!
                                </div>
                            </div>

                            <div class="col-12">
                                <label for="end" class="form-label">Ende des Termins</label>
                                <input type="datetime-local" class="form-control" id="end" name="end" value="<%if(!(inspection == null || inspection.getMeeting_end() == null)) { out.print(inspection.getMeeting_end()); } %>" required>
                                <div class="invalid-feedback">
                                    Der Endtermin ist verpflichtend!
                                </div>
                            </div>

                            <div class="col-12">
                                <label for="meeting_status" class="form-label">Status</label>
                                <select class="form-select" id="meeting_status" name="meeting_status" required>
                                    <%
                                        if(inspection == null) {
                                    %>
                                        <option selected>Wähle...</option>
                                        <option value="pending">Ausstehend</option>
                                        <option value="canceled">Abgesagt</option>
                                        <option value="completed">Abgeschlossen</option>
                                    <%
                                        }
                                        else if(inspection.getInspectionStatus() == InspectionStatus.pending) {
                                    %>
                                        <option>Wähle...</option>
                                        <option value="pending" selected>Ausstehend</option>
                                        <option value="canceled">Abgesagt</option>
                                        <option value="completed">Abgeschlossen</option>
                                    <%
                                        }
                                        else if(inspection.getInspectionStatus() == InspectionStatus.canceled) {
                                    %>
                                        <option>Wähle...</option>
                                        <option value="pending">Ausstehend</option>
                                        <option value="canceled" selected>Abgesagt</option>
                                        <option value="completed">Abgeschlossen</option>
                                    <%
                                        }
                                        else if(inspection.getInspectionStatus() == InspectionStatus.completed) {
                                    %>
                                        <option>Wähle...</option>
                                        <option value="pending">Ausstehend</option>
                                        <option value="canceled">Abgesagt</option>
                                        <option value="completed" selected>Abgeschlossen</option>
                                    <%
                                        } else {
                                    %>
                                        <option selected>Wähle...</option>
                                        <option value="pending">Ausstehend</option>
                                        <option value="canceled">Abgesagt</option>
                                        <option value="completed">Abgeschlossen</option>
                                    <%
                                        }
                                    %>
                                </select>
                                <div class="invalid-feedback">
                                    Wähle einen Status!
                                </div>
                            </div>

                            <button class="w-100 btn btn-primary" type="submit">Speichern</button>

                        <h4 class="mb-3">Mängel</h4>

                        <div class="table-responsive">
                            <table class="table align-middle table-striped text-center table-sm">
                                <thead>
                                <tr>
                                    <th scope="col">Beschreibung</th>
                                    <th scope="col">Priorität</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%
                                   if(defects != null && (!defects.isEmpty())) {
                                       for (Defect defect: defects) {
                                %>
                                <tr>
                                    <td><%=defect.getDefect()%></td>
                                    <td><%=defect.getPriority().label%></td>
                                </tr>
                                <%
                                        }
                                    } else {
                                %>
                                <div style="text-align: center;">Es wurden noch keine Mängel hinzugefügt!</div>
                                <%
                                    }
                                %>
                                </tbody>
                            </table>

                        </div>
                    </div>
                </form>
                <form method="post" action="defect-servlet" class="needs-validation" novalidate>
                    <input hidden type="number" name="inspectionId" id="inspectionId" value="<%if(!(inspection == null)) { out.print(inspection.getId()); } %>" >
                    <div class="col-12">
                        <label for="defect" class="form-label">Beschreibung</label>
                        <input type="text" class="form-control" id="defect" name="defect" placeholder="Keine Feuermelder" required>
                        <div class="invalid-feedback">
                            Die Beschreibung ist verpflichtend!
                        </div>
                    </div>

                    <div class="col-12">
                        <label for="priority" class="form-label">Priorität</label>
                        <select class="form-select" id="priority" name="priority" required>
                            <option>Wähle...</option>
                            <option value="low">Niedrig</option>
                            <option value="normal">Normal</option>
                            <option value="high">Hoch</option>
                            <option value="critical">Kritisch</option>
                        </select>
                        <div class="invalid-feedback">
                            Die Priorität ist verpflichtend!
                        </div>
                    </div>

                    <div class="col-12" style="margin-top: 20px;">
                        <button class="w-100 btn btn-primary" type="submit">Erstellen</button>
                    </div>
                </form>
            </div>
            <div style="margin-bottom: 40px;"></div>
        </main>
    </div>
</div>


<script src="assets/dist/js/bootstrap.bundle.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js" integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE" crossorigin="anonymous"></script><script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js" integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha" crossorigin="anonymous"></script><script src="dashboard.js"></script>
</body>
</html>
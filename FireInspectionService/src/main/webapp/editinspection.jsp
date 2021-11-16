<%@ page import="com.example.FireInspectionService.model.Inspection" %>
<%@ page import="com.example.FireInspectionService.database.InspectionDaoImplementation" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
    <title>Fire Inspection Service | SE 2021</title>
</head>
<body class="bg-gray-100 font-sans leading-normal tracking-normal">
<nav id="header" class="fixed w-full z-10 top-0">

    <div class="w-full md:max-w-4xl mx-auto flex flex-wrap items-center justify-between mt-0 py-3">

        <div class="pl-4">
            <a class="text-gray-900 text-base no-underline hover:no-underline font-extrabold text-xl" href="#">
                Verwaltung für Feuerbeschau
            </a>
        </div>

        <div class="block lg:hidden pr-4">
            <button id="nav-toggle" class="flex items-center px-3 py-2 border rounded text-gray-500 border-gray-600 hover:text-gray-900 hover:border-green-500 appearance-none focus:outline-none">
                <svg class="fill-current h-3 w-3" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                    <title>Menu</title>
                    <path d="M0 3h20v2H0V3zm0 6h20v2H0V9zm0 6h20v2H0v-2z" />
                </svg>
            </button>
        </div>

        <div class="w-full flex-grow lg:flex lg:items-center lg:w-auto hidden lg:block mt-2 lg:mt-0 bg-gray-100 md:bg-transparent z-20" id="nav-content">
            <ul class="list-reset lg:flex justify-end flex-1 items-center">
                <li class="mr-3">
                    <a href="index.jsp" class="bg-red-500 text-white active:bg-red-600 font-bold uppercase text-xs px-4 py-2 rounded shadow hover:shadow-md outline-none focus:outline-none mr-1 mb-1 ease-linear transition-all duration-150" type="button">
                        Liste aller Inspektionen
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="w-full">
<div class="my-36 px-4 md:px-6 leading-normal">
    <div class="flex items-center justify-center h-screen">
        <%
            Inspection inspection = null;
            int id = request.getParameter("id") != null ? Integer.parseInt(request.getParameter("id")) : -1;
            if(id != -1) {
                try {
                    inspection = InspectionDaoImplementation.getInspection(id);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
            } else {
                inspection = new Inspection();
            }
        %>
            <form method="post" action="inspections-servlet" class="bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4">
                <input hidden type="number" name="id" id="id" value="<%if(!(inspection == null)) { out.print(inspection.getId()); } %>" >
                <div class="mb-4">
                            <label class="block text-gray-700 text-sm font-bold mb-2" for="appraiser">
                                Prüfer
                            </label>
                            <input required type="text" value="<%if(!(inspection == null || inspection.getAppraiser() == null)) { out.print(inspection.getAppraiser()); } %>" name="appraiser" id="appraiser" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" placeholder="Name">
                        </div>
                        <div class="mb-6">
                            <label class="block text-gray-700 text-sm font-bold mb-2" for="owner">
                                Eigentümer
                            </label>
                            <input required type="text"  value="<%if(!(inspection == null || inspection.getOwner() == null)) { out.print(inspection.getOwner()); } %>" name="owner" id="owner" class="shadow appearance-none border border-red-500 rounded w-full py-2 px-3 text-gray-700 mb-3 leading-tight focus:outline-none focus:shadow-outline" placeholder="Name">
                            <input required type="tel" value="<%if(!(inspection == null || inspection.getTelephone_number_owner() == null)) { out.print(inspection.getTelephone_number_owner()); } %>" name="telephone_number_owner" id="telephone_number_owner" class="shadow appearance-none border border-red-500 rounded w-full py-2 px-3 text-gray-700 mb-3 leading-tight focus:outline-none focus:shadow-outline" placeholder="Telefonnummer">
                            <input required type="email" value="<%if(!(inspection == null || inspection.getEmail_owner() == null)) { out.print(inspection.getEmail_owner()); } %>" name="email_owner" id="email_owner" class="shadow appearance-none border border-red-500 rounded w-full py-2 px-3 text-gray-700 mb-3 leading-tight focus:outline-none focus:shadow-outline" placeholder="E-Mail">
                        </div>
                        <div class="mb-8">
                            <label class="block text-gray-700 text-sm font-bold mb-2" for="address">
                                Adresse
                            </label>
                            <input  type="text" value="<%if(!(inspection == null || inspection.getAddress() == null)) { out.print(inspection.getAddress()); } %>" name="address" id="address" class="shadow appearance-none border border-red-500 rounded w-full py-2 px-3 text-gray-700 mb-3 leading-tight focus:outline-none focus:shadow-outline" placeholder="Musterstraße 1, 1000 Musterstadt">
                        </div>
                        <div class="mb-10">
                            <label class="block text-gray-700 text-sm font-bold mb-2" for="building">
                                Gebäude
                            </label>
                            <input  type="text" value="<%if(!(inspection == null || inspection.getBuilding() == null)) { out.print(inspection.getBuilding()); } %>" name="building" id="building" class="shadow appearance-none border border-red-500 rounded w-full py-2 px-3 text-gray-700 mb-3 leading-tight focus:outline-none focus:shadow-outline" placeholder="Hauptgebäude">
                        </div>
                        <div class="mb-10">
                            <label class="block text-gray-700 text-sm font-bold mb-2" for="meeting_start">
                                Startzeit
                            </label>
                            <input  type="datetime-local" value="<%if(!(inspection == null || inspection.getMeeting_start() == null)) { out.print(inspection.getMeeting_start()); } %>" name="meeting_start" id="meeting_start" class="shadow appearance-none border border-red-500 rounded w-full py-2 px-3 text-gray-700 mb-3 leading-tight focus:outline-none focus:shadow-outline">
                        </div>
                        <div class="mb-10">
                            <label class="block text-gray-700 text-sm font-bold mb-2" for="meeting_end">
                                Endzeit
                            </label>
                            <input  type="datetime-local" value="<%if(!(inspection == null || inspection.getMeeting_end() == null)) { out.print(inspection.getMeeting_end()); } %>" name="meeting_end" id="meeting_end" class="shadow appearance-none border border-red-500 rounded w-full py-2 px-3 text-gray-700 mb-3 leading-tight focus:outline-none focus:shadow-outline">
                        </div>
                        <div class="mb-12">
                            <label class="block text-gray-700 text-sm font-bold mb-2" for="meeting_status">
                                Status
                            </label>
                            <select value="<%if(!(inspection == null || inspection.getInspectionStatus() == null)) { out.print(inspection.getInspectionStatus().toString()); } %>" id="meeting_status" name="meeting_status" class="form-select mt-1 block w-full">
                                <option value="pending">Ausstehend</option>
                                <option value="canceled">Abgesagt</option>
                                <option value="completed">Abgeschlossen</option>
                            </select>
                        </div>

                        <div class="mb-15">
                            <input class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline" type="submit">
                        </div>
      </form>
    </div>
</div>
</div>
<footer class="bg-white border-t border-gray-400 shadow">
    <div class="container max-w-4xl mx-auto flex py-8">

        <div class="w-full mx-auto flex flex-wrap">
            <div class="flex w-full md:w-1/2 ">
                <div class="px-8">
                    <h3 class="font-bold text-gray-900">About</h3>
                    <p class="py-4 text-gray-600 text-sm">
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas vel mi ut felis tempus commodo nec id erat. Suspendisse consectetur dapibus velit ut lacinia.
                    </p>
                </div>
            </div>

            <div class="flex w-full md:w-1/2">
                <div class="px-8">
                    <h3 class="font-bold text-gray-900">Social</h3>
                    <ul class="list-reset items-center text-sm pt-3">
                        <li>
                            <a class="inline-block text-gray-600 no-underline hover:text-gray-900 hover:text-underline py-1" href="#">Add social link</a>
                        </li>
                        <li>
                            <a class="inline-block text-gray-600 no-underline hover:text-gray-900 hover:text-underline py-1" href="#">Add social link</a>
                        </li>
                        <li>
                            <a class="inline-block text-gray-600 no-underline hover:text-gray-900 hover:text-underline py-1" href="#">Add social link</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</footer>

<script>
    document.getElementById('nav-toggle').onclick = function() {
        document.getElementById("nav-content").classList.toggle("hidden");
    }
</script>
</body>
</html>

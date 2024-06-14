<%-- 
    Document   : employeeList
    Created on : 5 Jun 2024, 3:44:07 pm
    Author     : Ahmad Afif Syahmi bin Ahmad Rozali
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Employee Management Application</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/aa5de83a5b.js" crossorigin="anonymous"></script>
        <style>
            nav {
                background-color: tomato;
            }
        </style>
    </head>
    <body>
        <header>
            <nav class="navbar navbar-expand-md navbar-dark">
                <div>
                    <a class="navbar-brand">Employee Management App</a>
                </div>
                <ul class="navbar-nav">
                    <li><a href="<%= request.getContextPath() %>/list" class="nav-link">Employee</a></li>
                </ul>
            </nav>
        </header>
        <br>
        <div class="row">
            <div class="container">
                <h3 class="text-center">List of Employees</h3>
                <hr>
                <div class="container text-left">
                    <a href="<%= request.getContextPath() %>/new" class="btn btn-success">Add New Employee</a>
                </div>
                <br>
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>E-Mail</th>
                            <th>Position</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="employee" items="${employees}">
                            <tr>
                                <td><c:out value="${employee.id}" /></td>
                                <td><c:out value="${employee.name}" /></td>
                                <td><c:out value="${employee.email}" /></td>
                                <td><c:out value="${employee.position}" /></td>
                                <td>
                                    <a href="edit?id=<c:out value='${employee.id}' />"><i class="fa-solid fa-pen-to-square"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;
                                    <a href="delete?id=<c:out value='${employee.id}' />"><i class="fa-solid fa-trash"></i></a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
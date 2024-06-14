<%-- 
    Document   : employeeForm
    Created on : 5 Jun 2024, 3:43:53 pm
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
        <div class="container col-md-5">
            <div class="card">
                <div class="card-body">
                    <c:if test="${employee != null}">
                        <form action="update" method="post">
                    </c:if>
                    <c:if test="${employee == null}">
                        <form action="insert" method="post">
                    </c:if>

                    <h2>
                        <c:if test="${employee != null}">
                            Edit Employee
                        </c:if>
                        <c:if test="${employee == null}">
                            Add New Employee
                        </c:if>
                    </h2>

                    <c:if test="${employee != null}">
                        <input type="hidden" name="id" value="<c:out value='${employee.id}' />">
                    </c:if>
                    
                    <fieldset class="form-group">
                        <label for="name">Name</label>
                        <input type="text" name="name" id="name" class="form-control" value="<c:out value='${employee.name}' />" required>
                    </fieldset>

                    <fieldset class="form-group">
                        <label for="email">E-Mail</label>
                        <input type="text" name="email" id="email" class="form-control" value="<c:out value='${employee.email}' />">
                    </fieldset>
                    
                    <fieldset class="form-group">
                        <label for="position">Position</label>
                        <input type="text" class="form-control" value="<c:out value='${employee.position}' />" readonly>
                        <input list="positionList" name="position" id="position" class="form-control">
                        <datalist id="positionList">
                            <option value="Manager"></option>
                            <option value="Head of Dept"></option>
                            <option value="Supervisor"></option>
                            <option value="Director"></option>
                        </datalist>
                    </fieldset>
                    
                    <button type="submit" class="btn btn-success">Save</button>
                </form>
                </div>
            </div>
        </div>
    </body>
</html>
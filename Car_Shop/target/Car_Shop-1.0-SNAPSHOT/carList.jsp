<%-- 
    Document   : carList
    Created on : 14 Jun 2024, 8:44:37 pm
    Author     : Ahmad Afif Syahmi bin Ahmad Rozali
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/aa5de83a5b.js" crossorigin="anonymous"></script>
        <title>Car Shop | List</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a class="navbar-brand" href="index.jsp">Car Shop</a>

            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="list">Cars</a>
                    </li>
                </ul>
            </div>
        </nav>
        <main class="container mt-3">
            <h1 class="text-center">List of Cars</h1>
            <hr>
            <a href="new"><button class="btn btn-primary">Add new car</button></a>

            <table class="table table-bordered mt-3">
                <thead class="table-dark text-center">
                    <tr>
                        <th>ID</th>
                        <th>Brand</th>
                        <th>Model</th>
                        <th>Cylinder</th>
                        <th>Price</th>
                        <th colspan="2">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="car" items="${cars}">
                        <tr>
                            <td><c:out value="${car.id}" /></td>
                            <td><c:out value="${car.brand}" /></td>
                            <td><c:out value="${car.model}" /></td>
                            <td><c:out value="${car.cylinder}" /></td>
                            <td><fmt:formatNumber type="number" maxFractionDigits="2" groupingUsed="false" value="${car.price}" /></td>
                            <td class="text-center"><a href="edit?id=<c:out value='${car.id}' />"><i class="fa-solid fa-pen-to-square"></i></a></td>
                            <td class="text-center"><a href="delete?id=<c:out value='${car.id}' />"><i class="fa-solid fa-trash"></i></a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </main>

        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
    </body>
</html>

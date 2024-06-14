<%-- 
    Document   : carForm
    Created on : 14 Jun 2024, 9:23:18 pm
    Author     : Ahmad Afif Syahmi bin Ahmad Rozali
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <title>Car Shop | Form</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a class="navbar-brand" href="index.jsp">Car Shop</a>

            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="list">Cars</a>
                    </li>
                </ul>
            </div>
        </nav>
        <main class="container mt-3">
            <div class="row justify-content-center">
                <div class="card col-6">
                    <div class="card-body">
                        <c:if test="${car != null}">
                            <form action="update" method="post">
                                <h2>Edit Car</h2>
                                <input type="hidden" name="id" value="<c:out value='${car.id}' />">
                        </c:if>
                        <c:if test="${car == null}">
                            <form action="insert" method="post">
                                <h2>Add New Car</h2>
                        </c:if>
                            <div class="form-group">
                                <label for="brand">Brand</label>
                                <input type="text" class="form-control" name="brand" id="brand" maxlength="15" value="<c:out value='${car.brand}' />" required>
                            </div>
                            <div class="form-group">
                                <label for="model">Model</label>
                                <input type="text" class="form-control" name="model" id="model" maxlength="30" value="<c:out value='${car.model}' />" required>
                            </div>
                            <div class="form-group">
                                <label for="cylinder">Cylinder</label>
                                <input type="number" class="form-control" name="cylinder" id="cylinder" min="0" value="<c:out value='${car.cylinder}' />" required>
                            </div>
                            <div class="form-group">
                                <label for="price">Price</label>
                                <input type="number" class="form-control" name="price" id="price" min="0" step="0.01" value="<c:out value='${car.price}' />" required>
                            </div>
                            <div class="d-flex justify-content-end">
                                <c:if test="${car != null}">
                                    <button type="reset" class="btn">Reset</button>
                                    <button type="submit" class="btn btn-primary">Save</button>
                                </c:if>
                                <c:if test="${car == null}">
                                    <button type="reset" class="btn">Clear</button>
                                    <button type="submit" class="btn btn-primary">Add</button>
                                </c:if>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </main>

        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
    </body>
</html>

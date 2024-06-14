<%-- 
    Document   : error
    Created on : 5 Jun 2024, 3:44:15 pm
    Author     : Ahmad Afif Syahmi bin Ahmad Rozali
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error page</title>
    </head>
    <body>
        <center>
            <h1>Error</h1>
            <h2><%= exception.getMessage() %></h2>
            <br>
        </center>
    </body>
</html>

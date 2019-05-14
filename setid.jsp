<%-- 
    Document   : setid
    Created on : Oct 2, 2017, 5:21:01 PM
    Author     : Rishab (D.E.A.T.H)
--%>
<%@ page import = "Order.asd" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
            asd.id=Integer.parseInt(request.getParameter("id")); 
            response.sendRedirect("Msummary.jsp");
        %>
    </body>
</html>

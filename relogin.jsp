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
            asd.username=(String)session.getAttribute("username");
            asd.re=1;
            //asd.mode=1;
            response.sendRedirect("login.jsp");
            %>
    </body>
</html>

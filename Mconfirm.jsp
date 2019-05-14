<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "Order.asd" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ordering...</title>
    </head>
    <body>
        <%
            try
            {                
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jspdb", "root", "mysql");

                if (con != null) 
                {
                    int bill=(Integer)session.getAttribute("bill");
                    String username=(String)session.getAttribute("username");
                    Statement ut=con.createStatement(); 
                    ut.executeUpdate("insert into orders(bill, username) values('"+bill+"','"+username+"')");
                    asd.smode=0;
                    ut.close();
                    con.close();
                    response.sendRedirect("Msummary.jsp");
                }
            }catch(Exception e)
            {
                out.println(e);
            }
        %>
    </body>
</html>

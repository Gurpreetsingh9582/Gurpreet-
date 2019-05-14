<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
             url = "jdbc:mysql://localhost:3306/jspdb"
             user = "root"  password = "mysql"/>
        <sql:update var="result" dataSource="${snapshot}">
            DELETE FROM menu
            WHERE name = "<%=(String)session.getAttribute("Pizza")%>";
        </sql:update>
                 <% response.sendRedirect("Medit.jsp");%>
    </body>
</html>

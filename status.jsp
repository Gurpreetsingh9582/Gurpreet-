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
        <title>JSP Page</title>
       <link href="css/Mlogin.css" rel="stylesheet" type="text/css" media="all" />
<!--online fonts-->
<link href="//fonts.googleapis.com/css?family=Lobster&amp;subset=cyrillic,latin-ext,vietnamese" rel="stylesheet">
<link href="//fonts.googleapis.com/css?family=Righteous&amp;subset=latin-ext" rel="stylesheet">
<style>
    th {
    padding: 15px;
}
td {
    padding: 0px;
    text-align: center;
}
</style>  
    </head>
    
    <body>
        <%response.setIntHeader("Refresh",10);%>
        <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
             url = "jdbc:mysql://localhost:3306/jspdb"
             user = "root"  password = "mysql"/>

             <sql:query dataSource = "${snapshot}" var = "result">
                 SELECT * from orders where username="<%=(String)session.getAttribute("username")%>";
             </sql:query>  
                 
        <h1><a href="index.jsp">P<span>i</span>zz<span>a</span> P<span>a</span>r<span>l</span>o<span>u</span><span>r</span></a></h1>
        <div class="wthree-form">
			<h2>ORDERS</h2>
		<div class="w3l-login form">
                    <form action = "setid.jsp" method="post">          
                        <table style="width:100%">
                            <tr>
                                <th><a></a></th>
                                <th><a>Order ID</a></th>
                                <th><a>Username</a></th>
                                <th><a>Status</a></th>
                                
                            </tr>
                            <c:forEach var = "row" items = "${result.rows}">
                            <tr>
                                <td align="right"><a><INPUT TYPE="radio" NAME="id" VALUE="${row.id}" CHECKED></a></td>
                                <td align="right"><a> ${row.id}</a></td>
                                <td align="right"><a> ${row.bill}</a></td>
                                <td align="right"><a> ${row.status}</a></td>		
                            </tr>
                            </c:forEach>
                        </table>
                        <input type="submit" value="View Details"/>
                    </form>
                    <table style="width:100%">
                        <tr><th><a href="neworder.jsp" class="btn btn-1 btn-1b">Hungry?</a></th>
                        <th></th><th></th><th></th><th></th><th></th><th></th><th></th>
                            <th></th><th><a href="Mlogout.jsp" class="btn btn-1 btn-1b">Signout-></a></th>
                            </tr>
                    </table>
		</div>
	</div>
            
		<div class="footer-agileits">
			<p>&copy; pizza parlor. All Rights Reserved | Design by <a href="http://pros.com/"> Pros</a></p>
		</div>                            
    </body>
</html>

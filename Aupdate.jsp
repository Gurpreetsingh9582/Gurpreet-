<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "Order.asd" %>
<!DOCTYPE html>
<html>

  <title>Order Status</title>
<link href="css/Aupdate.css" rel="stylesheet" type="text/css" media="all" />
<!--online fonts-->
<link href="//fonts.googleapis.com/css?family=Lobster&amp;subset=cyrillic,latin-ext,vietnamese" rel="stylesheet">
<link href="//fonts.googleapis.com/css?family=Righteous&amp;subset=latin-ext" rel="stylesheet">
<style>
    th {
    padding: 15px;
}
td {
    padding: 5px;text-align: center;
}
</style>    
</head>
<%response.setIntHeader("Refresh",10);%>
    <body>
        <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
             url = "jdbc:mysql://localhost:3306/jspdb"
             user = "root"  password = "mysql"/>

             <sql:query dataSource = "${snapshot}" var = "result">
                 SELECT * from orders;
             </sql:query>
                 
        <h1><a href="index.jsp">P<span>i</span>zz<span>a</span> P<span>a</span>r<span>l</span>o<span>u</span><span>r</span></a></h1>
        <div class="wthree-form">
			<h2>ORDERS</h2>
		<div class="w3l-login form">
                    <form action = "update.jsp" method="post">          
                        <table style="width:100%">
                            <tr>
                                <th><a>Order ID</a></th>
                                <th><a>Username</a></th>
                                <th><a>Amount</a></th>
                                <th><a>Status</a></th>
                            </tr>
                            <c:forEach var = "row" items = "${result.rows}">
                            <tr>
                                <td align="right"><a> ${row.id}</a></td>
                                <td align="right"><a> ${row.username}</a></td>
                                <td align="right"><a> ${row.bill}</a></td>
                            <c:set var="stat" value="${row.status}"/>
                            <c:choose>
                                <c:when test="${stat == 'DELIVERED'}">
                                    <td align="right"><a> ${row.status}</a></td>
                                </c:when>
                                <c:otherwise>
                                <td align="right"><a>
                                    <select name = "${row.id}">
                                            <option value = "P">PENDING</option>
                                            <option value = "D">DELIVERED</option>
                                    </select>
                                </a></td>
                                </c:otherwise>
                            </c:choose>			
                            </tr>
                            </c:forEach>
                        </table>
				<div class="submit-agileits">
					<input type="submit" value="Update">
				</div>
			 </form>
                    <table style="width:100%">
                        <tr><th><a href="Amain.jsp" class="btn btn-1 btn-1b"><-Home</a></th>
                        <th></th><th></th><th></th><th></th><th></th><th></th><th></th>
                            <th></th><th><a href="Mlogout.jsp" class="btn btn-1 btn-1b">Signout-></a></th>
                            </tr>
                    </table>
		</div>
	</div>          
                       
    </body>
</html>

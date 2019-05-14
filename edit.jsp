<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "Order.asd" %>
<!DOCTYPE html>
<html>

  <title>Edit Menu</title>
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
    <body>
        <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
             url = "jdbc:mysql://localhost:3306/jspdb"
             user = "root"  password = "mysql"/>

             <sql:query dataSource = "${snapshot}" var = "result">
                 SELECT * from menu where name="<%=request.getParameter("pizza")%>";
                 <% session.setAttribute("Pizza",request.getParameter("pizza"));%>
             </sql:query>
               <c:forEach var = "row" items = "${result.rows}">  
        <h1><a href="index.jsp">P<span>i</span>zz<span>a</span> P<span>a</span>r<span>l</span>o<span>u</span><span>r</span></a></h1>
        <div class="wthree-form">
			<h2>MENU</h2>
		<div class="w3l-login form">
                    <form action = "fedit.jsp" method="post">          
                        <div class="form-sub-w3">
				<input type="text" name="pizza" placeholder="${row.name}" />
			</div>
			<div class="form-sub-w3">
				<input type="text" name="small" placeholder="(Small)${row.small}" />
			</div>	
                        <div class="form-sub-w3">
				<input type="text" name="med" placeholder="(Medium)${row.med}" />
			</div>
			<div class="form-sub-w3">
				<input type="text" name="lar" placeholder="(Large)${row.lar}" />
			</div>	
                                                   		
               </c:forEach>
			<div class="submit-agileits">
                            <input type="submit" value="Confirm">
                        </div>
                    </form>
                    <table style="width:100%">
                        <tr><th><a href="remove.jsp" class="btn btn-1 btn-1b">(X) Remove this Pizza</a></th>
                        <th></th><th></th><th></th><th></th><th></th><th></th><th></th>
                            <th></th><th><a href="Mlogout.jsp" class="btn btn-1 btn-1b">Signout-></a></th>
                            </tr>
                    </table>
		</div>
	</div>                       
    </body>
</html>

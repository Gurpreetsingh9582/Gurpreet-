<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "Order.asd" %>
<!DOCTYPE html>
<html>

  <title>Update</title>
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
        <h1><a href="index.jsp">P<span>i</span>zz<span>a</span> P<span>a</span>r<span>l</span>o<span>u</span><span>r</span></a></h1>
        <div class="wthree-form">
			<h2>WELCOME <%=(String)session.getAttribute("username")%></h2>
		<div class="w3l-login form">
                    <form action = "status.jsp" method="post">      
				<div class="submit-agileits">
                                    <input type="submit" value="Past Orders">
				</div>
                    </form>
                    <form action = "neworder.jsp" method="post">      
				<div class="submit-agileits">
                                    <input type="submit" value="Order Now">
				</div>
                    </form>
                    <table style="width:100%">
                        <tr><th></th>
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

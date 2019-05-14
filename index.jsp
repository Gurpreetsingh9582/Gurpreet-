<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ page import = "Order.asd" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Pizza Parlour</title>
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Pizza Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
	Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //Custom Theme files -->
<link href="css/bootstrap.css" type="text/css" rel="stylesheet" media="all">
<link href="css/style1.css" type="text/css" rel="stylesheet" media="all">
<!--js-->
<script src="js/jquery-1.11.1.min.js"></script> 
<script src="js/modernizr.custom.js"></script>
<!-- //js -->

</head>
<body>
        <%
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/", "root", "mysql");

                if (con != null) 
                {
                    asd.login_flag=1;   
                    asd.reg_flag=1;
                    asd.mode=1;//for order
                    Statement st=con.createStatement();
                    st.executeUpdate("CREATE DATABASE IF NOT EXISTS jspdb");
                    st.executeUpdate("use jspdb");
                            
                    st.executeUpdate("CREATE TABLE IF NOT EXISTS credentials(name varchar(45),username varchar(45),no varchar(45),pswd varchar(45))");
                    st.executeUpdate("CREATE TABLE IF NOT EXISTS menu(name varchar(45), small int(5), sq int(2) default 0, st int(10) default 0, med int(5), mq int(2) default 0, mt int(10) default 0, lar int(5),  lq int(2) default 0, lt int(10) default 0)");
                    st.executeUpdate("CREATE TABLE IF NOT EXISTS admin(username varchar(45),pswd varchar(45))");        
                    st.executeUpdate("CREATE TABLE IF NOT EXISTS orders(id int(10) auto_increment,username varchar(45), bill int(7) default 0, status varchar(15) default 'PENDING', primary key (id))");
                    st.close();
                            
                    con.close();                                 
                }
                }catch(Exception e)
                {
                    out.println(e);
                }
%>
	<!--banner-->
	<div class="banner">
		<div class="banner-info">
			<div class="container">
				<div class="logo">
					<div class="ribbon">
						<div class="ribbon-fold">
							<h1> <a href="index.jsp">Pizza Parlour</a></h1>
						</div>
					</div>
				</div>			
			</div>
		</div>
	</div>
        <div class="banner-bottom">
		<div class="container">
			<div class="banner-text">
				<h3>Tasty Italian Pizza</h3>
				<a href="Mlogin.jsp" class="btn btn-1 btn-1b">Enter-></a>
			</div>
				</div>
	</div>
    <script src="js/bootstrap.js"></script>
</body>
</html>


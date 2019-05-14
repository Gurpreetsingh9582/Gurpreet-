<%-- 
    Document   : Mreg
    Created on : Sep 17, 2017, 11:54:00 AM
    Author     : Punkhazard
--%>
<%@ page import = "Order.asd" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Registration</title>
<!-- metatags-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="food court login form a Flat Responsive Widget,Login form widgets, Sign up Web 	forms , Login signup Responsive web form,Flat Pricing table,Flat Drop downs,Registration Forms,News letter Forms,Elements" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- Meta tag Keywords -->
<link href="css/Aupdate.css" rel="stylesheet" type="text/css" media="all" />
<!--online fonts-->
<link href="//fonts.googleapis.com/css?family=Lobster&amp;subset=cyrillic,latin-ext,vietnamese" rel="stylesheet">
<link href="//fonts.googleapis.com/css?family=Righteous&amp;subset=latin-ext" rel="stylesheet">

</head>
<body>
    
    <%asd.login_flag=1;%>
	<h1><a href="index.jsp">P<span>i</span>zz<span>a</span> P<span>a</span>r<span>l</span>o<span>u</span><span>r</span></a></h1>
	<div class="wthree-form">
			<h2>WELCOME</h2>
		<div class="w3l-login form">
			<form action="reg.jsp" method="post">
				<div class="form-sub-w3">
					<input type="text" name="name" placeholder="Name" required=""/>
				</div>
				<div class="form-sub-w3">
					<input type="text" name="username" placeholder="Username" required=""/>
				</div>
				<div class="form-sub-w3">
                                    <input type="text" name="no" placeholder="Contact no" required="" maxlength="10" />
				</div>
				<div class="form-sub-w3">
					<input type="password" name="pswd" placeholder="Password" required=""/>
				</div>
				<div class="submit-agileits">
					<input type="submit" value="Signup">
				</div>
				<pre>
					<a href="Mlogin.jsp">Already a user? Login</a>
				</pre>
<%if(asd.reg_flag==0)
  {
        %>
 <a style="color:red;">Username already in use</a>
        <%
  }
%>
<%if(asd.reg_flag==2)
  {
        %>
 <a style="color:greenyellow;">Registration Done</a>
        <%
  }
%>
			 </form>
		</div>
	</div>
</body>
</html>
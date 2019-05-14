<%@ page import = "Order.asd" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Login</title>
<link href="css/Aupdate.css" rel="stylesheet" type="text/css" media="all" />
<!--online fonts-->
<link href="//fonts.googleapis.com/css?family=Lobster&amp;subset=cyrillic,latin-ext,vietnamese" rel="stylesheet">
<link href="//fonts.googleapis.com/css?family=Righteous&amp;subset=latin-ext" rel="stylesheet">
<!--//online fonts-->
</head>
<body>
    <%
       asd.re=0;
       asd.reg_flag=1;
    %>
	<h1><a href="index.jsp">P<span>i</span>zz<span>a</span> P<span>a</span>r<span>l</span>o<span>u</span><span>r</span></a></h1>
	<div class="wthree-form">
			<h2>WELCOME</h2>
		<div class="w3l-login form">
			<form action="login.jsp" method="post">
				<div class="form-sub-w3">
					<input type="text" name="username" placeholder="Username" required=""/>
				</div>
				<div class="form-sub-w3">
					<input type="password" name="pswd" placeholder="Password" required=""/>
				</div>				
				<div class="submit-agileits">
					<input type="submit" value="Login">
				</div>
				<pre>
                                                <a href="Mreg.jsp">New here? Register  </a>
<%if(asd.login_flag==0)
  {
        %>
 <a style="color:red;">Invalid username/ password</a>
        <%
  }
%>
			 </form>
		</div>
	</div>
</body>
</html>

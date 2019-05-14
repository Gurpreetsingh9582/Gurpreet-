<%@ page import = "Order.asd" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Login</title>
<!-- metatags-->
<link href="css/Mlogin.css" rel="stylesheet" type="text/css" media="all" />
<!--online fonts-->
<link href="//fonts.googleapis.com/css?family=Lobster&amp;subset=cyrillic,latin-ext,vietnamese" rel="stylesheet">
<link href="//fonts.googleapis.com/css?family=Righteous&amp;subset=latin-ext" rel="stylesheet">
<!--//online fonts-->
</head>
<body>
        <%
        asd.login_flag=1;   
        asd.reg_flag=1;
     %>
	<h1><a href="index.jsp">P<span>i</span>zz<span>a</span> P<span>a</span>r<span>l</span>o<span>u</span><span>r</span></a></h1>
	<div class="wthree-form">
		<div class="w3l-login form">
			<form action="Mlogin.jsp" method="post">
                            <a style="color:red;">Sure you want to sign out?</a>
                                <div class="submit-agileits">
					<input type="submit" value="YES">
				</div>
			 </form>
                        <form action="relogin.jsp" method="post">
                                <div class="submit-agileits">
					<input type="submit" value="NO">
				</div>
			 </form>
		</div>
	</div>
		<div class="footer-agileits">
			<p>&copy; pizza parlor. All Rights Reserved | Design by <a href="http://pros.com/"> Pros</a></p>
		</div>
        <script>
    $(document).ready(function() {
        function disableBack() { window.history.forward() }

        window.onload = disableBack();
        window.onpageshow = function(evt) { if (evt.persisted) disableBack() }
    });
</script>
</body>
</html>



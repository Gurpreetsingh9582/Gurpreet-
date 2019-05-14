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
        <title>Ordering Page</title>
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
}
</style>  
    </head>
    <body> 
 <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
             url = "jdbc:mysql://localhost:3306/jspdb"
             user = "root"  password = "mysql"/>

             <sql:query dataSource = "${snapshot}" var = "result">
                 SELECT * from <%="m"+asd.id%>;
             </sql:query>
  <!--for demo wrap-->
  <h1><a href="index.jsp">P<span>i</span>zz<span>a</span> P<span>a</span>r<span>l</span>o<span>u</span><span>r</span></a></h1>
  <div class="wthree-form">
	<h2>Order No. <%=asd.id%></h2>
            <div class="w3l-login form">
                <form action="menu.jsp" method="POST">
                <table style="width:100%">
                    <tr>
                        <th><a>Name</a></th>
                        <th colspan="3"><a>Small</a></th>
                        <th colspan="3"><a>Medium</a></th>
                        <th colspan="3"><a>Large</a></th>
                    </tr>   
                    <%asd.i=0;%>
                <c:forEach var = "row" items = "${result.rows}">
                    <tr>
                      <td align="left"> <a><c:out value = "${row.name}"/></a></td>
                      <td> <a><c:out value = "${row.small}"/></a></td>
                      <td><a>X</a></td>
                      <td> <a><input type="number" name=<%="sq"+asd.i%> min="0" max="10" value=${row.sq}></a></td>
                      <td> <a><c:out value = "${row.med}"/></a></td>
                      <td><a>X</a></td>
                      <td> <a><input type="number" name=<%="mq"+asd.i%> min="0" max="10" value=${row.mq}></a></td>
                      <td> <a><c:out value = "${row.lar}"/></a></td>
                      <td><a>X</a></td>
                      <td> <a><input type="number" name=<%="lq"+asd.i%><%asd.i++;%> min="0" max="10" value=${row.lq}></a></td>                                             
                   </tr>
                </c:forEach>
                </table>
                    <input type="submit" value="Cart->"/>
                </form>
                  <%if(asd.bill==1)
  {
        %>
 <a style="color:red;">Cart cannot be empty!!</a>
        <%
  }
%>
                    <table style="width:100%">
                        <tr><th><a href="Mmain.jsp" class="btn btn-1 btn-1b"><-Home</a></th>
                        <th></th><th></th><th></th><th></th><th></th><th></th><th></th>
                            <th></th><th><a href="Mlogout.jsp" class="btn btn-1 btn-1b">Signout-></a></th>
                            </tr>
                    </table>
            </div>
  </div>


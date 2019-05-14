<%-- 
    Document   : reg
    Created on : Sep 17, 2017, 11:43:25 AM
    Author     : Punkhazard
--%>
<%@ page import = "Order.asd" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="javax.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>reg.jsp</title>
    </head>
    <body>
        <%
            try
            {
                String username=request.getParameter("username");
                
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jspdb", "root", "mysql");
                
                if (con != null) 
                {
                            Statement st=con.createStatement();
                            Statement at=con.createStatement();
                            st.executeUpdate("CREATE DATABASE IF NOT EXISTS jspdb");
                            st.executeUpdate("use jspdb");
                            st.executeUpdate("CREATE TABLE IF NOT EXISTS credentials(name varchar(45),username varchar(45),no varchar(45),pswd varchar(45))");

                            ResultSet rs=st.executeQuery("select * from credentials where username='"+username+"'");
                            ResultSet as=at.executeQuery("select * from admin where username='"+username+"'");
                            if(rs.next() || as.next())                 
                                asd.reg_flag=0;                                  
                            else
                            {
                                asd.reg_flag=2;
                                String name=request.getParameter("name");
                                String pswd=request.getParameter("pswd");
                                String no=request.getParameter("no");

                                st.executeUpdate("insert into credentials(name,username,no,pswd) values('"+name+"', '"+username+"', '"+no+"', '"+pswd+"')");
                            }
                            rs.close();
                            st.close();
                            as.close();
                            at.close();
                            con.close();
                            response.sendRedirect("Mreg.jsp");
                }
            }catch(Exception e)
            {
                out.println(e);
            }
            %>
    </body>
</html>

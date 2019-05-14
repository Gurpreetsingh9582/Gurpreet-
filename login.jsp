<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "Order.asd" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>login.jsp</title>
    </head>
    <body>
        <%
            try
            {
                String username=request.getParameter("username");
                String pswd=request.getParameter("pswd");
                if(asd.re==1)
                    username=asd.username;
                session.setAttribute("username", username);
                
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jspdb", "root", "mysql");
                
                if (con != null) 
                {
                            Statement st=con.createStatement();
                            Statement ut=con.createStatement();
                            Statement at=con.createStatement();
                            ResultSet rs=st.executeQuery("select * from credentials where username='"+username+"' and pswd='"+pswd+"'");
                            ResultSet ra=at.executeQuery("select * from admin where username='"+username+"' and pswd='"+pswd+"'");
                            if(ra.next())
                            {
                                asd.login_flag=1;
                                asd.user=0;
                                st.close();
                                at.close();
                                ut.close();
                                ra.close();
                                rs.close();
                                response.sendRedirect("Amain.jsp");                                
                            }
                            else if(rs.next())
                            {
                                    asd.login_flag=1;
                                    st.close();
                                    at.close();
                                    ut.close();
                                    ra.close();
                                    rs.close();
                                    response.sendRedirect("Mmain.jsp");
                                    

                                    
                                    try
                                    { ut.executeUpdate("create view v1 as select max(id) from orders");}
                                    catch(com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException e)
                                    { 
                                        ut.executeUpdate("drop view v1"); 
                                        ut.executeUpdate("create view v1 as select max(id) from orders");
                                    }

                                    rs=st.executeQuery("select * from v1");
                                    rs.next();
                                    if(rs.getString("max(id)")!=null)
                                    {
                                        String temp=rs.getString("max(id)");
                                        asd.id=Integer.parseInt(temp);
                                        asd.id++;
                                    }
                                    else
                                        asd.id=1;
                                    
                                    ut.executeUpdate("drop view v1");
                                    
                                    rs.close();
                                    try
                                    { ut.executeUpdate("CREATE TABLE m"+asd.id+" select * from menu where 0=0");}
                                    catch(com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException e)
                                    { 
                                        ut.executeUpdate("drop table m"+asd.id); 
                                        ut.executeUpdate("CREATE TABLE m"+asd.id+" select * from menu where 0=0");
                                    }
                                    //ut.executeUpdate("CREATE TABLE m"+asd.id+" select * from menu where 0=0");
                                    ut.close();
                                    st.close();
                                    con.close();   
                                    response.sendRedirect("Mmenu.jsp");
                            }                            
                            else
                            {
                                asd.login_flag=0;
                                st.close();
                                at.close();
                                ut.close();
                                ra.close();
                                rs.close();
                                response.sendRedirect("Mlogin.jsp");
                            }
                    }
            }catch(Exception e)
            {
                out.println(e);
            }
%>            
    </body>
</html>

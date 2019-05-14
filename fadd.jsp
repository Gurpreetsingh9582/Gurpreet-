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
        <title>JSP Page</title>
    </head>
    <body>
        <%  
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jspdb", "root", "mysql");

                if (con != null) 
                {
                            Statement st=con.createStatement();
                            Statement ut=con.createStatement();
                            String pizza=request.getParameter("pizza");
                            ResultSet rs=st.executeQuery("select * from menu where name='"+pizza+"'");
                            
                            if(rs.next())
                            {
                                asd.mpizza=1;
                                st.close();
                                ut.close();
                                rs.close();
                                con.close();
                                response.sendRedirect("add.jsp");
                            }
                            else
                            {
                                asd.mpizza=0;
                               String name=request.getParameter("pizza");
                               String small=request.getParameter("small");
                               String med=request.getParameter("med");
                               String lar=request.getParameter("lar");

                               if(name.length()==0)
                                   name=rs.getString("name");
                               if(small.length()==0)
                                   small=rs.getString("small");
                               if(med.length()==0)
                                   med=rs.getString("med");
                               if(lar.length()==0)
                                   lar=rs.getString("lar");
                               
                                ut.executeUpdate("insert into menu(name,small,med,lar) values('"+name+"','"+small+"','"+med+"','"+lar+"')");
                            }                                    
                                
                            st.close();
                            ut.close();
                            rs.close();
                            con.close();
                            response.sendRedirect("Medit.jsp");
                }
            }catch(Exception e)
            {
                out.println(e);
            }
        %>
    </body>
</html>

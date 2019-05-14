<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="javax.sql.*" %>
<%@ page import = "Order.asd" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>menu.jsp</title>
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
                            
                            ResultSet rs=st.executeQuery("select id from orders where status='PENDING'");
                            
                            while(rs.next())
                            {
                                String id=rs.getString("id");
                                String status=request.getParameter(id);
                                out.print(id+"  "+status+" ");
                                if(status.equals("D"))
                                {
                                    out.print("if ");
                                    ut.executeUpdate("update orders set status=\"DELIVERED\" where id='"+id+"'");
                                }
                            }
                            rs.close();
                            st.close();
                            ut.close();                            
                            con.close();
                            response.sendRedirect("Aupdate.jsp");
                }
            }catch(Exception e)
            {
                out.println(e);
            }
        %>
    </body>
</html>

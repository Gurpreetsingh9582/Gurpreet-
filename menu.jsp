<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="javax.sql.*" %>
<%@ page import = "Order.asd" %>
<!DOCTYPE html>

<html>
    <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
        <%  
            try
            {                
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jspdb", "root", "mysql");

                if (con != null) 
                {
                            Statement st=con.createStatement();
                            Statement ut=con.createStatement();
                            
                            int bill=0;
                            ResultSet rs=st.executeQuery("select * from m"+asd.id);%>
  <!--for demo wrap-->
  <h1><a href="index.jsp">P<span>i</span>zz<span>a</span> P<span>a</span>r<span>l</span>o<span>u</span><span>r</span></a></h1>
  <div class="wthree-form">
	<h2>CART</h2>
            <div class="w3l-login form">
                <form action="Mconfirm.jsp" method="POST">
                <table style="width:100%">
                    <tr>
                        <th><a>Item</a></th>
                        <th align="right"><a>Price</a></th>
                        <th><a>Qty</a></th>
                        <th align="right"><a>Total</a></th>
                    </tr>   
<%                            
                            for(int j=0; j<=asd.i && rs.next(); j++)
                            {
                                int flag=0;
                                String name=rs.getString("name");
                                int temps=Integer.parseInt(request.getParameter("sq"+j));
                                int tempm=Integer.parseInt(request.getParameter("mq"+j));
                                int templ=Integer.parseInt(request.getParameter("lq"+j));
                                ut.executeUpdate("update m"+asd.id+" set sq='"+temps+"', mq='"+tempm+"', lq='"+templ+"' where name='"+name+"'");
                                                                
                                if(temps!=0)
                                {   
                                    int price=Integer.parseInt(rs.getString("small"));
                                    int total=temps*price;
                                    bill+=total;
                                    ut.executeUpdate("update m"+asd.id+" set st='"+total+"' where name='"+name+"'");
                                    %>
                                    <tr>
                                        <td align="left"><a><%=name+ " (Small)"%></a></td>
                                        <td align="right"><a><%=price%></a></td>
                                        <td><a><%="X "+temps%></a></td>
                                        <td align="right"><a><%=total%></a></td>
                                    </tr>
                                    <%

                                }
                                else
                                    ut.executeUpdate("update m"+asd.id+" set st='"+0+"' where name='"+name+"'");
                                
                                if(tempm!=0)
                                {   
                                    int price=Integer.parseInt(rs.getString("med"));
                                    int total=tempm*price;
                                    bill+=total;
                                    %>
                                    <tr>
                                        <td align="left"><a><%=name+ " (Medium)"%></a></td>
                                        <td align="right"><a><%=price%></a></td>
                                        <td><a><%="X "+tempm%></a></td>
                                        <td align="right"><a><%=total%></a></td>
                                    </tr>
                                    <%
                                }
                                else
                                    ut.executeUpdate("update m"+asd.id+" set mt='"+0+"' where name='"+name+"'");                                
                                
                                if(templ!=0)
                                {   
                                    int price=Integer.parseInt(rs.getString("lar"));
                                    int total=templ*price;
                                    bill+=total;
                                    ut.executeUpdate("update m"+asd.id+" set lt='"+total+"' where name='"+name+"'");
                                   %>
                                    <tr>
                                        <td align="left"><a><%=name+ " (Large)"%></a></td>
                                        <td align="right"><a><%=price%></a></td>
                                        <td><a><%="X "+templ%></a></td>
                                        <td align="right"><a><%=total%></a></td>
                                    </tr>
                                    <%
                                }
                                else
                                    ut.executeUpdate("update m"+asd.id+" set lt='"+0+"' where name='"+name+"'");
                                
                            }
                            st.close();
                            ut.close();
                            rs.close();
                            con.close();                                       
        %>
        <tr><!--footer-->
          <td></td>
          <td></td>
          <td  align="right"><a>Total</a></td>
          <td align="right"><a><%=bill%><%double gst=bill*.18;%></a></td>
        </tr>
      <tr><!--footer-->
          <td></td>
          <td></td>
          <td  align="right"><a>GST 18%</a></td>
          <td align="right"><a><%=(int)gst%><%bill+=(int)gst;%></a></td>
        </tr>        
      <tr><!--footer-->
          <td></td>
          <td></td>
          <td  align="right"><a>Net Total</a></td>
          <td align="right"><a><%=bill%></a></td>
          <%
              session.setAttribute("bill", bill); 
              if(bill==0)
              {
                  asd.bill=1;
                 response.sendRedirect("Mmenu.jsp");
              }
              else
                asd.bill=0;
          %>
        </tr>
    </table>
                    
                        <input type="submit" value="Confirm"/>
                    </form>
                    <table style="width:100%">
                        <tr><th><a href="Mmenu.jsp" class="btn btn-1 btn-1b">Edit cart?</a></th>
                        <th></th><th></th><th></th><th></th><th></th><th></th><th></th>
                            <th></th><th><a href="Mlogout.jsp" class="btn btn-1 btn-1b">Signout-></a></th>
                            </tr>
                    </table>
		</div></div>
          <%
                  }
            }catch(Exception e)
            {
                out.println(e);
            }
%>
    </body>
</html>

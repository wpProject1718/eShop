<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <%@page import="java.sql.*" %>
    <head>
        <title>This is a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <%
            Connection conn = null;
            Statement stmt = null;
            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
            } catch (Exception E) {}
            try {
                conn = DriverManager.getConnection(
                    "jdbc:mysql:///db?user=root&password=");
                stmt =  conn.createStatement(
                            ResultSet.TYPE_SCROLL_SENSITIVE,  
                            ResultSet.CONCUR_UPDATABLE); 
            } catch (SQLException E) {
                out.println("Cannot connect database!");
            }
            
            ResultSet rs = stmt.executeQuery("select * from user");

            out.println("*** User Information ***");
            ResultSetMetaData meta = rs.getMetaData();
            int fieldCount = meta.getColumnCount();
            out.println("<table border=\"2\"><tr>");
            for(int i=1;i<=fieldCount;i++)  {
                out.println("<td>"+meta.getColumnName(i)+"</td> ");
            }
            out.println("</tr>");
            
            while(rs.next())
            {   out.println("<tr>");
                out.println("<td>" +rs.getString("user_id") + "</td>");
                out.println("<td>" +rs.getString("name") + "</td>");
                out.println("<td>" +rs.getString("pw") + "</td>");
                out.println("<td>" +rs.getString("age") + "</td>");
                out.println("</tr>");
            }
            out.println("</table>");

%>
    </body>
</html>

<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import = "java.io.*,java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		out.println("Cannot connect db!");
	}
	
	String id = (String)request.getParameter("id");
	String name = (String)request.getParameter("name");
    if(id==null || name==null){
		out.println("Please enter the id and the category name");
	}else{
		int inserted = stmt.executeUpdate("UPDATE category SET cat_name='"+name+"' WHERE cat_id="+id);
		if(inserted==1){
			out.println("Update succeed: \n\tCategory name \""+name+"\"");
			//response.sendRedirect("index.htm");
		}else{
			out.println("Update fail! Somethings go wrong");
		}
	
	}
%>
</body>
</html>
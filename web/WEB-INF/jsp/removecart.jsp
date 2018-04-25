<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import = "java.io.*,java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<body>
    <div style="padding: 70px 0 70px 0;">
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
	
	String uid = request.getParameter("uid");
	String pid = request.getParameter("pid");
    if(pid == null || uid == null){
		out.println("Please enter the userid AND product id!");
	}else{
		Boolean pass = false;
		ResultSet rs = stmt.executeQuery("select * from cart_temp where user_id ='"+uid+"' AND product_id = '" +pid+"'");
		while(rs.next())
		{   
			pass = true;
		}
		
		if(!pass){
			out.println("Record in cart not found! Please check");
		}else{
			int removed = stmt.executeUpdate("DELETE FROM cart_temp WHERE user_id ='"+uid+"' AND product_id = '" +pid+"'");
			if(removed == 1){
				out.println("Removed!");
			}else{
				out.println("Remove failed!");
		
			}
				
		}
	}
%>
    </div>
</body>
</html>
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
	
	String name = (String)request.getParameter("name");
    if(name==null){
		out.println("Please enter the category name!");
	}else{
		Boolean pass = true;
		ResultSet rs = stmt.executeQuery("select * from category where cat_name ='"+name+"'");
		
		while(rs.next())
		{   
			if(rs.getString("cat_name").equals(name)){
				pass = false;
				break;
			}
		}
		
		if(!pass){
			out.println("Category name \""+name+"\" has been created!");
		}else{
			String query ="INSERT into category (cat_name) values(\""+name+"\")";
					int inserted = stmt.executeUpdate(query);
					if(inserted==1){
						out.println("Create succeed: \n\tCategory name \""+name+"\"");
						//response.sendRedirect("index.htm");
					}else{
						out.println("Create fail! Somethings go wrong");
					}
		}
	
	}
%>
</body>
</html>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import = "java.io.*,java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../jsp/getheader.jsp"/>
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
	
	String name = request.getParameter("username");
	String pw = request.getParameter("password");
    if(name == null || pw == null){
		out.println("Please enter the user name AND password!");
	}else{
		Boolean pass = false;
		int id = -1;
		int usertype = -1;
		int enable = -1;
		ResultSet rs = stmt.executeQuery("select * from user where name ='"+name+"' AND pw = '" +pw+"'");
		
		while(rs.next())
		{   
			if(rs.getString("name").equals(name) && rs.getString("pw").equals(pw)){
				pass = true;
				id = rs.getInt("user_id");
				usertype = rs.getInt("type");
				enable = rs.getInt("enable");
				break;
			}
		}
		
		if(!pass){
			out.println("Account not found! Please check");
		}else{
			if(enable == 1){//Account valid
				out.println("Welcome back! " + name);
				switch(usertype){
					case 1:
						out.println("(Customer)");
						break;
					case 2:
						out.println("(Seller)");
						break;
					case 3:
						out.println("(Administrator)");
						break;
				}
				session.setAttribute("userid",id);
				session.setAttribute("type",usertype);
			}else{
				out.println("Your acconut has been banned.");
			}
		}
	}
%>
    </div>
</body>
<c:import url="../html/footer.html"/>
</html>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Register</title>
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
	
	String name = request.getParameter("name");
	String pw = request.getParameter("pw");
	Boolean pass = true;
	ResultSet rs = stmt.executeQuery("select * from user where name ='"+name+"'");
	
	while(rs.next())
	{   
		if(rs.getString("name").equals(name)){
			pass = false;
			break;
		}
	}
	
	if(!pass){
		out.println("User name \""+name+"\" has been registered!");
	}else{
		String query ="INSERT into User (name,pw,registerDate) values(\""+name+"\",\""+pw+"\","+"NOW())";
                int inserted = stmt.executeUpdate(query);
                if(inserted==1){
                    out.println("Register succeed: \n\tUser name \""+name+"\"");
                }else{
                    out.println("Register fail! Somethings go wrong");
                }
	}
%>
</body>
</html>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Create Success</title>
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
	String price = request.getParameter("price");
	String cat = request.getParameter("cat");
	String num = request.getParameter("num");
	String img = request.getParameter("img");
	String info = request.getParameter("info");
    if(name == null || price == null|| cat == null|| num == null|| info == null){
		out.println("Please field in all the required data");
	}else{
		Boolean pass = true;
		ResultSet rs = stmt.executeQuery("select * from product where product_name ='"+name+"'");
		while(rs.next())
		{   
			if(rs.getString("product_name").equals(name)){
				pass = false;
				break;
			}
		}
		
		if(!pass){
			out.println("Same product name has already existed. Please check.");
		}else{
			int inserted = stmt.executeUpdate("INSERT into product (product_name,product_price,product_info,product_num,product_cat,product_img) values('"+name+"','"+price+"','"+info+"','"+num+"','"+cat+"','"+img+"')");
			out.println("INSERT into product (product_name,product_price,product_info,product_num,product_cat,product_img) values('"+name+"','"+price+"','"+info+"','"+num+"','"+cat+"','"+img+"'");
			if(inserted==1){
				out.println("Create succeed: \n\tProduct name \""+name+"\"");
				//response.sendRedirect("index.htm");
			}else{
				out.println("Create fail! Somethings go wrong");
			}
		}
	}
	
%>
</body>
</html>
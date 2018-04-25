<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import = "java.io.*,java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<body>
    <div style="padding: 70px 0 70px 0;">
<%
	Connection conn = null;
	Statement stmt = null;
	Statement stmt1 = null;
	Statement stmt2 = null;
	Statement stmt3 = null;
	Statement stmt4 = null;
	try {
		Class.forName("com.mysql.jdbc.Driver").newInstance();
	} catch (Exception E) {}
	try {
		conn = DriverManager.getConnection(
			"jdbc:mysql:///db?user=root&password=");
		stmt =  conn.createStatement(
					ResultSet.TYPE_SCROLL_SENSITIVE,  
					ResultSet.CONCUR_UPDATABLE); 
		stmt1 =  conn.createStatement(
					ResultSet.TYPE_SCROLL_SENSITIVE,  
					ResultSet.CONCUR_UPDATABLE); 
		stmt2 =  conn.createStatement(
					ResultSet.TYPE_SCROLL_SENSITIVE,  
					ResultSet.CONCUR_UPDATABLE); 
		stmt3 =  conn.createStatement(
					ResultSet.TYPE_SCROLL_SENSITIVE,  
					ResultSet.CONCUR_UPDATABLE); 
		stmt4 =  conn.createStatement(
					ResultSet.TYPE_SCROLL_SENSITIVE,  
					ResultSet.CONCUR_UPDATABLE); 
		
	} catch (SQLException E) {
		out.println("Cannot connect db!");
	}
	
	String uid = request.getParameter("uid");
	
    if(uid == null){
		out.println("Please enter the userid");
	}else{
		ResultSet rs = stmt.executeQuery("select * from cart_temp where user_id ='"+uid+"'");
		Boolean pass = false;
		while(rs.next())
		{   
			int cart_pnum = rs.getInt("product_num");
			String cart_pid = rs.getString("product_id");
			ResultSet rset = stmt1.executeQuery("select * from product where product_id='"+ cart_pid+"'");
			pass = true;
			
			while(rset.next())
			{   
				int pnum = rset.getInt("product_num");
				String pprice = rset.getString("product_price");
				if(cart_pnum<=pnum){		
					int remained = pnum-cart_pnum;
					int removed = stmt2.executeUpdate("UPDATE product SET product_num='"+remained+"' WHERE product_id='"+cart_pid+"'");
					int added = stmt3.executeUpdate("INSERT into purchase_rec (user_id,product_id,product_price,product_num) values('"+uid+"','"+cart_pid+"','"+pprice+"','"+cart_pnum+"')");
					int deleted = stmt4.executeUpdate("DELETE FROM cart_temp WHERE user_id ='"+uid+"' AND product_id = '" +cart_pid+"'");

					if(removed != 1||added!=1||deleted!=1){
						out.println("Something happened");
					}
				}
				break;
			}
		}
		if(!pass){
			out.println("Nothing to check out.");
		}else{
			out.println("Check out success");
		}
	}
%>
    </div>
</body>
</html>
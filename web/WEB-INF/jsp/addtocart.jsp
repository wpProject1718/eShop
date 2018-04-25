<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
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
	
	String uid = request.getParameter("uid");
	String pid = request.getParameter("pid");
	String num = request.getParameter("quantity");
	int curr = 0;
    if(uid == null || pid == null|| num == null){
		out.println("Please field in all the required data");
	}else{
		Boolean pass = false;
		ResultSet rs = stmt.executeQuery("select * from product where product_id ='"+pid+"'");
		while(rs.next())
		{   
			if(rs.getInt("product_num")>=Integer.parseInt(num)){
				curr = rs.getInt("product_num");
				pass = true;//enough
			}
		}
		
		Boolean added = false;
		int alreadyadded = 0;
		ResultSet rstat = stmt.executeQuery("select * from cart_temp where product_id ='"+pid+"' AND user_id = '" +uid+"'");
		while(rstat.next())
		{   
			if(curr<rstat.getInt("product_num")+Integer.parseInt(num)){
				pass = false;//enough
			}
			alreadyadded = rstat.getInt("product_num");
			added = true;
		}
		
		if(!pass){
			out.println("The product you choose is too large. Current in stock: " + curr);
		}else{
			int inserted = -1;
			if(added){
				inserted = stmt.executeUpdate("UPDATE cart_temp SET product_num='"+(alreadyadded+num)+"' WHERE product_id="+pid+"' AND user_id ='"+uid+"'");
			}else{
				inserted = stmt.executeUpdate("INSERT into cart_temp (user_id,product_id,product_num) values('"+uid+"','"+pid+"','"+num+"')");
			
			}
			if(inserted==1){
				out.println("Add to cart succeed.");
				//response.sendRedirect("index.htm");
			}else{
				out.println("Add to cart fail! Somethings go wrong");
			}
		}
	}
	
%>
</body>
<c:import url="../html/footer.html"/>
</html>
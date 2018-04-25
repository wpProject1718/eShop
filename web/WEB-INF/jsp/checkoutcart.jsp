<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Checkout Cart</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            $(':button').click(function () {
				var but_name = $(this).attr("id").split("_");
				if(but_name[0] == "RemoveProduct"){
					var target = but_name[1];
					alert("uid=" +$("#userid").val()+"&pid="+but_name[1]);
					$.ajax({
                        type: "post",
                        url: "removecart.jsp", //this is my servlet
                        data: "uid=" +$("#userid").val()+"&pid="+but_name[1],
                        success: function(msg){      
                            $("#response").html(msg);
							
                        }
                    });
				}
				
				
            });
        });
    </script>
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
	double total = 0;
	if(session.getAttribute("userid")!= null){
//		int userid = Integer.parseInt(session.getAttribute("userid"));
		ResultSet rs = stmt.executeQuery("select product.product_id, product.product_name, product.product_price, product.product_img, cart_temp.product_num from product LEFT JOIN cart_temp ON product.product_id=cart_temp.product_id where cart_temp.user_id ='"+session.getAttribute("userid")+"'");
		
		out.println("<table>");
		out.println("<tr><td>Product image</td><td>Product name</td><td>Product Price</td><td>Added Quantity</td><td>Delete?</td></tr>");

		while(rs.next())
		{   
			String pro_id = rs.getString("product_id");
			String pro_name = rs.getString("product_name");
			String pro_price = rs.getString("product_price");
			String pro_img = rs.getString("product_img");
			String pro_num = rs.getString("product_num");
		
			out.println("<tr><td><img src=\""+pro_img + "\"/></td>");
			out.println("<td>"+pro_name + "</td>");
			out.println("<td>$"+pro_price + "</td>");
			out.println("<td>"+ pro_num+ "</td>");
			out.println("<td><input type='button' value='Remove' id='RemoveProduct_"+ pro_id+ "'/></td></tr>");
			total += Double.parseDouble(pro_price)*Double.parseDouble(pro_num);
		}
		out.println("</table>");
		out.println("Total: $"+total);
		out.println("<input type='hidden' id='userid' value='" + session.getAttribute("userid") + "'/>");
		out.println("<div id='response'></div>");
	}else{
		out.println("<marquee>What you find here are not existed~</marquee>");
	}
%>

</body>
</html>
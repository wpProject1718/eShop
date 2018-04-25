<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>View Product</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
	$(document).ready(function () {
		$("#minus, #plus").click(function () {
			var max = $("#quantity").attr('max');
			var temp = parseInt($("#quantity").val());
			if(this.id=='minus'){
				if(parseInt($("#quantity").val()) >0){
					temp--;
					$("#quantity").val(temp)
				}
			}else{
				if(parseInt($("#quantity").val()) <max){
					temp++;
					$("#quantity").val(temp);
				}
			}
		});
		$("#addtocart").click(function () {
			var max = $("#quantity").attr('max');
			var pid = $("#productid").val();
			var uid = $("#userid").val();
			if(parseInt($("#quantity").val()) ==0){
				alert("Please add at least one first.");
			}else{
				$.ajax({
					type: "post",
					url: "addtocart.jsp", //this is my servlet
					data: "uid=" +uid+"&pid="+pid+"&quantity="+$("#quantity").val(),
					success: function(msg){     
						$("#response").html(msg);
	//                           $("#register")[0].reset();
					},
					error: function(XMLHttpRequest, textStatus, errorThrown) { 
						alert("Status: " + textStatus); alert("Error: " + errorThrown); 
					}   
				});
			}
		});
	});
	
	
	
</script>
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
	
	String id = request.getParameter("productid");
	if(id!=null){
		
		ResultSet rs = stmt.executeQuery("select product.*,category.cat_name from product LEFT JOIN category ON category.cat_id=product.product_cat where product_id ='"+id+"'");
		
		while(rs.next())
		{   
			String pro_id = rs.getString("product_id");
			String pro_name = rs.getString("product_name");
			String pro_price = rs.getString("product_price");
			String pro_info = rs.getString("product_info");
			String pro_num = rs.getString("product_num");
			String pro_cat = rs.getString("cat_name");
			String pro_img = rs.getString("product_img");
		
			out.println("<table>");
			out.println("<tr>");
			out.println("<tr><td colspan='2'><img src=\""+pro_img + "\"/></td></tr>");
			out.println("<tr><td>Product Name: </td><td>"+pro_name + "</td></tr>");
			out.println("<tr><td>Category</td><td>"+ pro_cat+ "</td></tr>");
			out.println("<tr><td>Price: </td><td>$"+pro_price + "</td></tr>");
			out.println("<tr><td>Available in Stock</td><td>"+ pro_num+ "</td></tr>");
			out.println("<tr><td>Product information: </td><td>"+pro_info + "</td></tr>");
			
			if (session.getAttribute("userid") != null){
				out.println("<tr><td>Add to cart</td><td><input type='button' id ='minus' value='-'/><input type='text' disabled='disabled' id ='quantity' min ='0' max='"+pro_num+"' readonly='readonly' value='1'/><input type='button' id ='plus' value='+'/></td></tr>");
				out.println("<tr><td></td><td><input type='button' id ='addtocart' value='Add to Cart'/></td></tr>");
				out.println("<tr><td></td><td><input type='hidden' id='productid' value='"+pro_id+"'/><input type='hidden' id='userid' value='"+session.getAttribute("userid")+"'/></td></tr>");
				out.println("<tr><td></td><td><div id='response'></div></td></tr>");
			  
			  // session.setAttribute(visitCountKey,  visitCount);
			}
			out.println("</table>");
			break;
		}
		
	}else{
		out.println("<marquee>What you find here are not existed~</marquee>");
	}
%>

</body>
</html>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel='stylesheet' type='text/css' href='css/thumbnail.css' >
<c:import url="../jsp/getheader.jsp"/>
</head>
<body>
    <div style="padding: 60px 0 70px 0;">
        <div class="container" style="padding-top: 20px;">
            <div class="row">
				
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
                                
				String cat_id = request.getParameter("category");
                                
				Boolean pass = true;
				ResultSet rs = stmt.executeQuery("select * from product where product_cat = "+ cat_id +" ORDER BY product_id ASC LIMIT 16");
				
				while(rs.next())
				{   
					String pro_id = rs.getString("product_id");
					String pro_name = rs.getString("product_name");
					String pro_price = rs.getString("product_price");
					String pro_img = rs.getString("product_img");
				
					out.println("<ul class='thumbnails list-unstyled'>");
					out.println("<li class='col-md-3 col-sm-6 col-xs-12'>");
					out.println("<div class='thumbnail'>");
					out.println("<div class='Product'>");
					out.println("<a href='product.htm?productid="+pro_id+"'>");
					out.println("<img class=' img-rounded img-responsive'  src='"+pro_img+"'>");
					out.println("</a>");
					out.println(" <div class='caption'>");
					out.println("<h3 id='ProductName'>"+pro_name+"</h3>");
					out.println("<p> Price:$"+pro_price+"</p>");
					out.println("<div id='submitBtn'>");
					//out.println("<a id='Add_"+pro_id+"'><button type='submit' class='btn btn-info food-btn' value=''><i class='	glyphicon glyphicon-plus'></i>Add to cart</button></a>&nbsp;");
					out.println("</div>");
					out.println("</div>");
					out.println("</div>");
					out.println("</div>");
					out.println("</li>");
                                        out.println("</ui>");
				}
				
				%>

            </div>
        </div>
    </div>
</body>
<c:import url="../html/footer.html"/>
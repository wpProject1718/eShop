<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<title>Add New Product</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            $("#image").focusout(function () {
                imghref = $("#image").val();
				if(imghref.indexOf(".jpg")>0||imghref.indexOf(".png")>0){
					$("#preview").attr('src',imghref);
				}
            });
			$("#submit").click(function () {
				
                pname = $("#name").val();
                pprice = $("#price").val();
                pcat = $("#cat").val();
                pnum= $("#num").val();
                imghref = $("#image").val();
                pinfo = $("#info").val();
				if(pname.length==0||pprice.length==0||pnum.length==0||imghref.length==0){
					alert("Some value are missing! Please check.");
				}else{
					
					if(imghref.indexOf(".jpg")==-1&&imghref.indexOf(".png")==-1){
						alert("The link of the image is invalid. Please check(Only accept jpg and png)");
					}else if(/(^\d+$|^\d+[.]\d{1}$)/.test(pprice)&&/(^\d+$|^\d+[.]\d{1}$)/.test(pnum)){
						alert("name=" +pname+"&price="+pprice+"&cat="+pcat+"&num="+pnum+"&img="+imghref+"&info="+pinfo);
						$.ajax({
							type: "post",
							url: "createproductsuccess.jsp", //this is my servlet
							data: "name=" +pname+"&price="+pprice+"&cat="+pcat+"&num="+pnum+"&img="+imghref+"&info="+pinfo,
							success: function(msg){      
								alert("msg");
	 //                           $("#register")[0].reset();
							},
							error: function(XMLHttpRequest, textStatus, errorThrown) { 
								alert("Status: " + textStatus); alert("Error: " + errorThrown); 
							}   
						});
					}else{
						alert("Some field are invalid(price/quantity)");
					}
				}
				
            });
        });
		
		
		
    </script>
<%@ page import = "java.io.*,java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../jsp/getheader.jsp"/>
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

	ResultSet rs = stmt.executeQuery("select * from category ORDER by cat_id asc");
%>

	<form method="POST" action="">
    	<table>
        	<tr>
            	<td>Product Name:</td>
                <td><input name="pro_name" type="text" id="name"/></td>
            </tr>
           	<tr>
            	<td>Product Price</td>
                <td><input name="pro_price" type="number" id="price"/></td>
            </tr>
           	<tr>
            	<td>Product Category</td>
                <td><select name="category" id ="cat">
				<%
					while(rs.next())
					{   
                    	out.println("<option value='" +rs.getString("cat_id") + "'>"+rs.getString("cat_name")+"</option>");
					}
				%>
                </select>
   			  </td>
            </tr>
            
           	<tr>
            	<td>Product quantity</td>
                <td><input name="pro_num" type="number" id="num" min="1"/></td>
            </tr>
           	<tr>
            	<td>Product Information</td>
                <td><textarea name="pro_info" cols="3" rows="3" id="info"></textarea></td>
            </tr>
           <tr>
            	<td>Product Image</td>
                <td><input name="pro_img" type="text" id="image"/></td>
            </tr> 
           <tr>
            	<td>Preview</td>
                <td><img src="" alt="" id="preview"></td>
            </tr> 
           <tr>
            	<td></td>
                <td>
                    <input type="button" value="Create Product" id="submit"/>
                    <input type="reset" value="Reset" id="reset"/>
                </td>
            </tr> 
		
        </table>
	</form>	
</body>
</html>
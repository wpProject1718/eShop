<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import = "java.io.*,java.util.*" %>
<html>
<head>
<title>Add New Product</title>
</head>
<body>
<script language = "javascript">
	function Validate(fileName,fileTypes) {
		var dots = fileName.split(".");
		var fileType = "." + dots[dots.length-1];
		if (Upload_Valid.datafile.value == ""){	
			alert("You haven't browse a file\nPlease select a new file and try again.");
			return false;
			}else if(fileTypes.join(".").indexOf(fileType) != -1){
				return true;
			}else{
				alert("Please only upload files that end in types: \n\n" + (fileTypes.join(" .")) + "\n\nPlease select a new file and try again.");
				return false;
			}
	}

</script>
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

	ResultSet rs = stmt.executeQuery("select * from cateogry");
%>

	<form method="POST" action="" enctype="multipart/form-data" onsubmit="return Validate(Upload_Valid.datafile.value,['gif','jpg','png','jpeg'])">
    	<table>
        	<tr>
            	<td>Product Name:</td>
                <td><input name="pro_name" type="text" id="name"/></td>
            </tr>
           	<tr>
            	<td>Product Price</td>
                <td><input name="pro_price" type="text" id="price"/></td>
            </tr>
           	<tr>
            	<td>Product Category</td>
                <td><select name="category">
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
                <td><input name="pro_num" type="text" id="num"/></td>
            </tr>
           	<tr>
            	<td>Product Information</td>
                <td><textarea name="pro_info" cols="" rows="" id="info"></textarea></td>
            </tr>
           	<tr>
            	<td>Product Image</td>
                <td>File to upload: <input type="file" name="file"></td>
            </tr> 
            
           	<tr>
            	<td>Product Image</td>
                <td>File to upload: <input type="file" name="file" accept="image/gif, image/jpeg, image/jpg, image/png"></td>
            </tr> 
		<input type="button" value="Create Product" id="submit"/>
		<input type="reset" value="Reset" id="reset"/>
        </table>
	</form>	
</body>
</html>
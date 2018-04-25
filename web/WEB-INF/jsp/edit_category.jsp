<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Edit Category</title>
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
	
	ResultSet rs = stmt.executeQuery("select * from category ORDER BY cat_id asc");
	
%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            $(':button').click(function () {
				var sep = $(this).attr("id").split("_");
                var name = $("#catname_"+sep[1]).val();
				if(name.length>0 && name.indexOf("&") == -1){
					 $.ajax({
                        type: "post",
                        url: "editcatsuccess.jsp", //this is my servlet
                        data: "id=" +sep[1]+"&name="+name,
                        success: function(msg){      
                            $("#response").html(msg);
							
                        }
                    });
				}else{
					alert("The field cannot be empty!.")
				}
            });
        });
    </script>
</head>

<body>
<table>
	<tr>
		<td>
			Category ID:
		</td>
		<td colspan = '2'>
			Name
		</td>
	</td>
	<%
	while(rs.next())
		{   
			out.println("<tr id='cat_"+rs.getString("cat_id")+"'><td>"+rs.getString("cat_id")+"</td>");
			out.println("<td><input type='text' id='catname_"+rs.getString("cat_id")+"' value='"+rs.getString("cat_name")+"'/></td>");			
			out.println("<td><input type='button' value='Confirm Edit' id='button_"+rs.getString("cat_id")+"'></td></tr>");

		}
	%>
  <tr>
    <td colspan='2'>
        <div id="response"></div>
    </td>
  </tr>
</table>

</form>
</body>
</html>
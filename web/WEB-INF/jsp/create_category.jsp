<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import = "java.io.*,java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../jsp/getheader.jsp"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            $("#submit").click(function () {
                name = $("#name").val();
                if (name == "") {
                    alert("Empty field. Please correct it.");
                } else {
                     $.ajax({
                        type: "post",
                        url: "createcatsuccess.jsp", //this is my servlet
                        data: "name=" +name,
                        success: function(msg){      
                            $("#response").html(msg);
                            $("#category").reset();
                        }
                    });
                    //$("#category").submit();
                }
            });
        });
    </script>
</head>
<body>
	<form method="POST" id="category">
    	<table>
        	<tr>
            	<td>Category name</td>
                <td><input name="pro_name" type="text" id="name"/></td>
            </tr>
           	<tr>
            	<td></td>
                <td>
                	<input type="button" value="Create Product" id="submit"/>
					<input type="reset" value="Reset" id="reset"/>
                </td>
        </table>
	</form>	
</body>
</html>
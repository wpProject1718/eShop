<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import = "java.io.*,java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../jsp/getheader.jsp"/>
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
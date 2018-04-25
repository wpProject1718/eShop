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
                //alert(name);
                $.ajax({
                    type: "post",
                    url: "addcat.htm", //this is my servlet
                    data: "name=" + name,
                    success: function (msg) {
                        $("#response").html(msg);
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert("Status: " + textStatus);
                        alert("Error: " + errorThrown);
                    }
                });
                //$("#category").submit();
            }
        });
    });
</script>
</head>
<body>
    <div style="padding: 60px 0 70px 0;">
        <form method="POST" id="category">
            <table>
                <tr>
                    <td>Category name</td>
                    <td><input name="pro_name" type="text" id="name" name="name"/></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <input type="button" value="Create Category" id="submit"/>
                        <input type="reset" value="Reset" id="reset"/>
                    </td>
                <tr>
                    <td colspan='2'>
                        <div id="response"></div>
                    </td>
                </tr>
            </table>
        </form>	
    </div>
</body>
</html>
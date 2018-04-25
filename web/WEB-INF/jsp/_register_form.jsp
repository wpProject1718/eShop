<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../jsp/getheader.jsp"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>

    $(document).ready(function () {
        $("#sub").click(function () {
            name = $("#user_name").val();
            pw = $("#user_pw").val();
            //alert(name + ": " + name.length);
            //alert(pw + ": " + pw.length);
            if (name.length == 0 || pw.length == 0) {
                alert("Empty field. Please correct it.");
                return false;
            } else {
                $("#register").submit(); // submit form

            }
        });
    });
</script>
</head>
<body>
    <div style="padding: 70px 0 70px 0;">
        <form action="" method="post" id="register"><table width="200" border="1">
                <tr>
                    <td>
                        <label for="user_name">User name: </label></td>
                    <td>
                        <input type="text" name="user_name" id="user_name" value=""/></td>
                </tr>
                <tr>
                    <td>
                        <label for="user_pw">Password: </label></td>
                    <td>
                        <input type="password" name="user_pw" id="user_pw" value=""/></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <input type="button" value="Register" id="sub"/>
                        <input type="reset" value="Reset" />

                    </td>
                </tr>
                <tr>
                    <td colspan='2'>
                        <div id="response"></div>
                    </td>
                </tr>
            </table>

        </form>
    </div>
</body>
<c:import url="../html/footer.html"/>
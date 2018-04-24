<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../html/header.html"/>
<!DOCTYPE html>

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
                        <input type="submit" value="Register" />
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
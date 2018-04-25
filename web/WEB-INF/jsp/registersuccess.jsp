<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import = "java.io.*,java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../jsp/getheader.jsp"/>
</head>
<body>
    <div style="padding: 70px 0 70px 0;">
        <%
            Connection conn = null;
            Statement stmt = null;
            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
            } catch (Exception E) {
            }
            try {
                conn = DriverManager.getConnection(
                        "jdbc:mysql:///db?user=root&password=");
                stmt = conn.createStatement(
                        ResultSet.TYPE_SCROLL_SENSITIVE,
                        ResultSet.CONCUR_UPDATABLE);
            } catch (SQLException E) {
                out.println("Cannot connect db!");
            }

            String name = (String) request.getAttribute("username");
            String pw = (String) request.getAttribute("password");

            Boolean pass = true;
            ResultSet rs = stmt.executeQuery("select * from user where name ='" + name + "'");

            while (rs.next()) {
                if (rs.getString("name").equals(name)) {
                    pass = false;
                    break;
                }
            }

            if (!pass) {
                out.println("User name \"" + name + "\" has been registered!");
            } else {
                String query = "INSERT into User (name,pw,registerDate) values(\"" + name + "\",\"" + pw + "\"," + "NOW())";
                int inserted = stmt.executeUpdate(query);
                if (inserted == 1) {
                    out.println("Register succeed: \n\tUser name \"" + name + "\"");
                    rs = stmt.executeQuery("select * from user where name ='" + name + "' AND pw = '" + pw + "'");

                    int id = -1, usertype = -1;
                    while (rs.next()) {
                        pass = true;
                        id = rs.getInt("user_id");
                        usertype = rs.getInt("type");
                        break;
                    }
                    session.setAttribute("userid", id);
                    session.setAttribute("type", usertype);
                } else {
                    out.println("Register fail! Somethings go wrong");
                }
            }
        %>
    </div>
</body>
<c:import url="../html/footer.html"/>
</html>
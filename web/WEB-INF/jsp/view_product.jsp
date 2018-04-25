<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import = "java.io.*,java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../jsp/getheader.jsp"/>
</head>
<body>
    <div style="padding: 70px 0 70px 0;">
        <%
            String temp = "123";
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

            String id = request.getParameter("productid");
            if (id != null) {

                Boolean pass = false;
                ResultSet rs = stmt.executeQuery("select product.*,category.cat_name from product LEFT JOIN category ON category.cat_id=product.product_cat where product_id ='" + id + "'");

                while (rs.next()) {
                    pass = true;
                }

                if (!pass) {
                    out.println("<marquee>What you find here are not existed~</marquee>");
                } else {
                    String pro_id = rs.getString("product.product_id");
                    String pro_name = rs.getString("product.product_name");
                    String pro_price = rs.getString("product.product_price");
                    String pro_info = rs.getString("product.product_info");
                    String pro_num = rs.getString("product.product_num");
                    String pro_cat = rs.getString("category.cat_name");
                    String pro_img = rs.getString("product.product_img");

                    out.println("<table>");
                    out.println("<tr>");
                    out.println("<tr><td colspan='2'><img src=\"....." + pro_img + "/></td></tr>");
                    out.println("<tr><td>Product Name: </td><td>" + pro_id + "</td></tr>");
                    out.println("<tr><td>Price: </td><td>" + pro_name + "</td></tr>");
                    out.println("<tr><td>Product information: </td><td>" + pro_info + "</td></tr>");
                    out.println("<tr><td>category</td><td>" + pro_id + "</td></tr>");

                    if (!session.isNew()) {
                        out.println("<tr><td>Add to cart</td><td><input type='button' id ='minus' value='-'/><input type='text' disabled='disabled' id ='quantity' min ='0' max='" + pro_num + "' readonly='readonly'/><input type='button' id ='plus' value='+'/></td></tr>");

                        // session.setAttribute(visitCountKey,  visitCount);
                    }

                    out.println("</table>");
                }
            } else {
                out.println("<marquee>What you find here are not existed~</marquee>");
            }
        %>
        <a href="AddDescriptionForEvent.jsp?count=<%=temp%>" ></a>
    </div>
</body>
<c:import url="../html/footer.html"/>
</html>
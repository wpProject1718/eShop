<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import = "java.io.*,java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../jsp/getheader.jsp"/>
<link rel='stylesheet' type='text/css' href='css/receipt.css' >
</head>
<body>
    <div style="padding: 70px 0 70px 0;">
        <%
            Connection conn = null;
            Statement stmt = null;
            Statement stmt1 = null;
            Statement stmt2 = null;
            Statement stmt3 = null;
            Statement stmt4 = null;
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
                stmt1 = conn.createStatement(
                        ResultSet.TYPE_SCROLL_SENSITIVE,
                        ResultSet.CONCUR_UPDATABLE);
                stmt2 = conn.createStatement(
                        ResultSet.TYPE_SCROLL_SENSITIVE,
                        ResultSet.CONCUR_UPDATABLE);
                stmt3 = conn.createStatement(
                        ResultSet.TYPE_SCROLL_SENSITIVE,
                        
                        ResultSet.CONCUR_UPDATABLE);
                stmt4 = conn.createStatement(
                        ResultSet.TYPE_SCROLL_SENSITIVE,
                        ResultSet.CONCUR_UPDATABLE);

            } catch (SQLException E) {
                out.println("Cannot connect db!");
            }

            if (session.getAttribute("userid") == null) {
                out.println("Please enter the userid");
            } else {
                ResultSet rs = stmt.executeQuery("select * from cart_temp where user_id ='" + session.getAttribute("userid") + "'");
                Boolean pass = false;
                   double total =0;

                out.println("<div style=padding: 50px 0 60px 0;>"
                        + "<div class='container'>"
                        + "<div class='row'>"
                        + "<div id='receipt'>"
                        + "<h2 class='text-primary'><b>Receipt</b></h2>"
                        + "</div>"
                        + "<div id='receipt'>"
                        //+ "<h5>(Receipt)</h5>"
                        + "</div>"
                        + "<table class='table table-hover'>"
                        + "<thead>"
                        + "<tr>"
                        + "<th>Product</th>"
                        + "<th class='text-center'>Quality</th>"
                        + "<th class='text-center'>Price</th>"
                        + "<th class='text-center'>Sub-total</th>"
                        + "</tr>"
                        + "</thead>"
                        + "<tbody>");
                while (rs.next()) {
                    int cart_pnum = rs.getInt("product_num");
                    String cart_pid = rs.getString("product_id");
                    ResultSet rset = stmt1.executeQuery("select * from product where product_id='" + cart_pid + "'");
                    pass = true;
                    String pname = "";
                    while (rset.next()) {
                        int pnum = rset.getInt("product_num");
                        String pprice = rset.getString("product_price"); 
                        pname = rset.getString("product_name"); 
                        if (cart_pnum <= pnum) {
                            int remained = pnum - cart_pnum;
                            int removed = stmt2.executeUpdate("UPDATE product SET product_num='" + remained + "' WHERE product_id='" + cart_pid + "'");
                            int added = stmt3.executeUpdate("INSERT into purchase_rec (user_id,product_id,product_price,product_num) values('" + session.getAttribute("userid") + "','" + cart_pid + "','" + pprice + "','" + cart_pnum + "')");
                            int deleted = stmt4.executeUpdate("DELETE FROM cart_temp WHERE user_id ='" + session.getAttribute("userid") + "' AND product_id = '" + cart_pid + "'");
                            
                            total += cart_pnum*Double.parseDouble(pprice);
                            if (removed != 1 || added != 1 || deleted != 1) {
                                out.println("Something happened");
                            }
                            out.println("<tr>"
                                    + "<td class='col-md-9'><h4><em>"+pname+"</em></h4></td>"
                                    + "<td class='col-md-1' style='text-align: center'> "+cart_pnum+" </td>"
                                    + "<td class='col-md-1 text-center'>$"+pprice+"</td>"
                                    + "<td class='col-md-1 text-center'>$"+cart_pnum*Double.parseDouble(pprice)+"</td>"
                                    + "</tr>");

                            
                        }
                        break;
                    }
                }
                out.println("<tr>"
                                    + "<td></td>"
                                    + "<td></td>"
                                    + "<td class='text-right'><h3><b>Total:</b></h3></td>"
                                    + "<td class='text-center text-danger'><h3><b>$"+total+"</b></h3></td>"
                                    + "</tr>"
                                    + "</tbody>"
                                    + "</table>"
                                    + "</div>"
                                    + "</div>"
                                    + "</div>");
                if (!pass) {
                    //out.println("Nothing to check out.");
                } else {
                    //out.println("Check out success");
                }
            }
        %>
    </div>
</body>
<c:import url="../html/footer.html"/>
</html>

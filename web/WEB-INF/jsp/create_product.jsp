<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<html>
    <head>
        <title>Add New Product</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script>
            $(document).ready(function () {
                $("#image").focusout(function () {
                    imghref = $("#image").val();
                    if (imghref.indexOf(".jpg") > 0 || imghref.indexOf(".png") > 0) {
                        $("#preview").attr('src', imghref);
                    }
                });
                $("#submit").click(function () {

                    pname = $("#name").val();
                    pprice = $("#price").val();
                    pcat = $("#cat").val();
                    pnum = $("#num").val();
                    imghref = $("#image").val();
                    pinfo = $("#info").val();
                    if (pname.length == 0 || pprice.length == 0 || pnum.length == 0 || imghref.length == 0) {
                        alert("Some value are missing! Please check.");
                    } else {

                        if (imghref.indexOf(".jpg") == -1 && imghref.indexOf(".png") == -1) {
                            alert("The link of the image is invalid. Please check(Only accept jpg and png)");
                        } else if (/(^\d+$|^\d+[.]\d{1}$)/.test(pprice) && /(^\d+$|^\d+[.]\d{1}$)/.test(pnum)) {
                            //alert("name=" + pname + "&price=" + pprice + "&cat=" + pcat + "&num=" + pnum + "&img=" + imghref + "&info=" + pinfo);
                            $.ajax({
                                type: "post",
                                url: "createproduct.htm", //this is my servlet
                                data: "name=" + pname + "&price=" + pprice + "&cat=" + pcat + "&num=" + pnum + "&img=" + imghref + "&info=" + pinfo,
                                success: function (msg) {
                                    $("#response").html(msg);
                                    //                           $("#register")[0].reset();
                                },
                                error: function (XMLHttpRequest, textStatus, errorThrown) {
                                    alert("Status: " + textStatus);
                                    alert("Error: " + errorThrown);
                                }
                            });
                        } else {
                            alert("Some field are invalid(price/quantity)");
                        }
                    }

                });
                $("#fileup").click(function (event) {

                    //stop submit the form, we will post it manually.
                    event.preventDefault();

                    // Get form
                    var form = $('#fileUploadForm')[0];

                    // Create an FormData object 
                    var data = new FormData(form);

                    // If you want to add an extra field for the FormData
                    data.append("CustomField", "This is some extra data, testing");

                    // disabled the submit button
                    $("#btnSubmit").prop("disabled", true);

                    $.ajax({
                        type: "POST",
                        enctype: 'multipart/form-data',
                        url: "uploadFile.htm",
                        data: data,
                        processData: false,
                        contentType: false,
                        cache: false,
                        timeout: 600000,
                        success: function (data) {

                            $("#result").html(data);
                            console.log("SUCCESS : ", data);
                            $("#btnSubmit").prop("disabled", false);

                        },
                        error: function (e) {

                            $("#result").text(e.responseText);
                            console.log("ERROR : ", e);
                            $("#btnSubmit").prop("disabled", false);

                        }
                    });

                });
            });



        </script>
        <%@ page import = "java.io.*,java.util.*" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <c:import url="../jsp/getheader.jsp"/>
    </head>
    <body>
        <div style="padding: 80px 0 70px 0;">
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

                ResultSet rs = stmt.executeQuery("select * from category ORDER by cat_id asc");
            %>

            <form method="POST" action="">
                <table>
                    <tr>
                        <td>Product Name:</td>
                        <td><input name="pro_name" type="text" id="name"/></td>
                    </tr>
                    <tr>
                        <td>Product Price</td>
                        <td><input name="pro_price" type="number" id="price"/></td>
                    </tr>
                    <tr>
                        <td>Product Category</td>
                        <td><select name="category" id ="cat">
                                <%
                                    while (rs.next()) {
                                        out.println("<option value='" + rs.getString("cat_id") + "'>" + rs.getString("cat_name") + "</option>");
                                    }
                                %>
                            </select>
                        </td>
                    </tr>

                    <tr>
                        <td>Product quantity</td>
                        <td><input name="pro_num" type="number" id="num" min="1"/></td>
                    </tr>
                    <tr>
                        <td>Product Information</td>
                        <td><textarea name="pro_info" cols="20" rows="5" id="info"></textarea></td>
                    </tr>
                    <tr>
                        <td>Product Image</td>
                        <td><input name="pro_img" type="text" id="image"/></td>
                    </tr> 
                    <tr>
                        <td>Preview</td>
                        <td><img src="" alt="" id="preview"></td>
                    </tr> 
                    <tr>
                        <td></td>
                        <td>
                            <input type="button" value="Create Product" id="submit"/>
                            <input type="reset" value="Reset" id="reset"/>
                        </td>
                    </tr> 
                    <tr>
                        <td></td>
                        <td>
                            <div id='response'></div>
                        </td>
                    </tr>
                </table>
            </form>	
            <form method="POST" id="fileUploadForm" action="uploadFile.htm" enctype="multipart/form-data">
                Product Photo Upload <input type="file" name="file"><br /> 
                <input type="button" id ="fileup" value="Upload"> Press here to upload the photo!
            </form>
            <span id="result"></span>
        </div>
    </body>
</html>
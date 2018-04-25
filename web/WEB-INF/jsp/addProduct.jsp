<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<c:import url="../jsp/getheader.jsp"/>
<link rel='stylesheet' type='text/css' href='css/product.css' >
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
</head>

<body>
    <form method="POST" action="">
        <div style="padding: 50px 0 60px 0;">
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

            <div class="container">

                <div class="row">
                    <div class="col-sm-5 col-xs-12"><h2>Add Product</h2></div>
                </div>

                <hr/>

                <div class="form-group row">
                    <label class="col-sm-3 col-xs-3"> Product Name <span class="text-danger">*</span></label>
                    <div class="col-md-6 col-sm-9 col-xs-9">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                            <input type="text" class="form-control" id="name" placeholder="Name of Product">
                        </div>
                    </div>
                </div>

                <div class="form-group row">
                    <label class="col-sm-4 col-xs-3"> Price <span class="text-danger">*</span></label>
                    <div class="col-md-3 col-sm-9 col-xs-9">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-usd"></i></span>
                            <input type="number" class="form-control" id="price" placeholder="Price"  min="1">
                        </div>
                    </div>
                </div>

                <div class="form-group row">
                    <label class="col-sm-4 col-xs-3"> Inventory <span class="text-danger">*</span></label>
                    <div class="col-md-3 col-sm-9 col-xs-9">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-briefcase"></i></span>
                            <input type="number" class="form-control" id="num" placeholder="Inventory"  min="1">
                        </div>
                    </div>
                </div>

                <div class="form-group row">
                    <label class="col-sm-3 col-xs-3"> Description <span class="text-danger">*</span></label>
                    <div class="col-md-6 col-sm-9 col-xs-9">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-info-sign"></i></span>
                            <textarea class="form-control" id="info" maxlength="255" placeholder="Please input product information here."></textarea>
                        </div>
                    </div>
                </div>


                <div class="form-group row">
                    <label class="col-sm-3 col-xs-3"> Category <span class="text-danger">*</span></label>
                    <div class="col-md-6 col-sm-9 col-xs-9" style="text-align: left;">
                        <select name="category" id ="cat">
                            <%
                                while (rs.next()) {
                                    out.println("<option value='" + rs.getString("cat_id") + "'>" + rs.getString("cat_name") + "</option>");
                                }
                            %>
                        </select>
                    </div>
                </div>



                <div class="form-group row">
                    <label class="col-sm-3 col-xs-3"> Product Photo <span class="text-danger">*</span></label>
                    <div class="col-md-5 col-sm-9 col-xs-9">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-paperclip"></i></span>
                            <input type="text" class="form-control" name="pro_img" id="image" placeholder="Image link">
                        </div>
                    </div>
                </div>

                <div class="form-group row">
                    <label class="col-sm-3 col-xs-3"> Photo Preview </label>
                    <div class="col-md-5 col-sm-9 col-xs-9" style="text-align: left;">
                        <img src="" alt="" id="preview">
                    </div>
                </div>

                <hr>

                <div class="form-group">
                    <label class="col-sm-3 col-xs-3"></label>
                    <div class="col-md-5 col-sm-9 col-xs-9" id="buttonSet">
                        <button type="button" class="btn btn-primary" id="submit">Submit</button>
                        <button type="reset" class="btn btn-primary" id="reset">Clear</button>
                    </div>
                </div>

                <div class="form-group row">
                    <label class="col-sm-3 col-xs-3"></label>
                    <div class="col-md-5 col-sm-9 col-xs-9" style="text-align: left;">
                        <div id='response'></div>
                    </div>
                </div>

            </div>
        </div>
    </form>
</body>
<c:import url="../html/footer.html"/>
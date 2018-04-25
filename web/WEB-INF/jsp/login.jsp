<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../jsp/getheader.jsp"/>
<link rel='stylesheet' type='text/css' href='css/login.css' >
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
    $(document).ready(function () {
        $("#submit").click(function () {

            name = $("#username").val();
            pw = $("#password").val();

            if (name.length == 0 || pw.length == 0) {
                alert("Empty field. Please correct it.");
                return false;
            } else {
                //$("#login").submit(); // submit form
                //alert(name + pw);
                $.ajax({
                    type: "post",
                    url: "login_process.htm", //this is my servlet
                    data: "username=" + name + "&password=" + pw,
                    success: function (msg) {
                        ///alert(msg);
                        $("#response").html(msg);
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert("Status: " + textStatus);
                        alert("Error: " + errorThrown);
                    }
                });
            }
        });
    });
</script>
</head>
<body>
    <form action="login_process.htm" method="post" id="login">
        <div style="padding: 50px 0 70px 0;">
            <div class="container" style="padding-top: 20px;">

                <div class="row">
                    <div class="col-sm-5 col-xs-12" id="title"><h3>Login Page</div>
                </div>

                <hr/>

                <div class="form-group row">
                    <label class="col-sm-3 col-xs-3"> Login ID <span class="text-danger">*</span></label>
                    <div class="col-md-5 col-sm-9 col-xs-9">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                            <input type="text" class="form-control" id="username" name="username" placeholder="Username" value="">
                        </div>
                    </div>
                </div>

                <div class="form-group row">
                    <label class="col-sm-3 col-xs-3"> Password <span class="text-danger">*</span></label>
                    <div class="col-md-5 col-sm-9 col-xs-9">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                            <input type="password" class="form-control" id="password" name="password" placeholder="Password" value="">
                        </div>
                    </div>
                </div>

                <div class="form-group row">
                    <label class="col-sm-3 col-xs-3"></label>
                    <div class="col-md-5 col-sm-9 col-xs-9" id="buttonSet">
                        <button type="button" class="btn btn-primary" id="submit" name="submit">Login</button>
                    </div>
                </div>
                
                <div class="form-group row">
                    <label class="col-sm-3 col-xs-3"></label>
                    <div class="col-md-5 col-sm-9 col-xs-9">
                        <div id='response'></div>
                    </div>
                </div>
                
            </div>
        </div>
    </form>
</body>
<c:import url="../html/footer.html"/>
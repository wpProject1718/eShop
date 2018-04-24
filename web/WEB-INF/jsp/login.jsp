<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../html/header.html"/>
<link rel='stylesheet' type='text/css' href='css/login.css' >

</head>

<body>
    <div style="padding: 50px 0 70px 0;">
        <div class="container" style="padding-top: 20px;">

            <div class="row">
                <div class="col-sm-5 col-xs-12" id="title"><h3>Login Page</h></div>
            </div>

            <hr/>

            <div class="form-group row">
                <label class="col-sm-3 col-xs-3"> Login ID <span class="text-danger">*</span></label>
                <div class="col-md-5 col-sm-9 col-xs-9">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                        <input type="text" class="form-control" name="loginID" placeholder="Login ID">
                    </div>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-3 col-xs-3"> Password <span class="text-danger">*</span></label>
                <div class="col-md-5 col-sm-9 col-xs-9">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                        <input type="password" class="form-control" name="password" placeholder="Password">
                    </div>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-3 col-xs-3"></label>
                <div class="col-md-5 col-sm-9 col-xs-9" id="buttonSet">
                    <button type="submit" class="btn btn-primary">Login</button>
                    <a href="../customers/forgetPassword" class="btn btn-primary">Forget Password</a>
                </div>
            </div>
        </div>
    </div>
</body>
<c:import url="../html/footer.html"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../jsp/getheader.jsp"/>
<link rel='stylesheet' type='text/css' href='css/product.css' >
<script type="text/javascript" src="js/addPhoto.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
</head>

<body>
    <form id="form" name="form" method="POST" action="uploadFile.htm" enctype="multipart/form-data">
        <div style="padding: 50px 0 60px 0;">
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
                            <input type="text" class="form-control" name="name" placeholder="Name of Product">
                        </div>
                    </div>
                </div>

                <div class="form-group row">
                    <label class="col-sm-4 col-xs-3"> Price <span class="text-danger">*</span></label>
                    <div class="col-md-3 col-sm-9 col-xs-9">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-usd"></i></span>
                            <input type="text" class="form-control" name="price" placeholder="Price">
                        </div>
                    </div>
                </div>

                <div class="form-group row">
                    <label class="col-sm-4 col-xs-3"> Inventory <span class="text-danger">*</span></label>
                    <div class="col-md-3 col-sm-9 col-xs-9">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-briefcase"></i></span>
                            <input type="text" class="form-control" name="inventory" placeholder="Inventory">
                        </div>
                    </div>
                </div>

                <div class="form-group row">
                    <label class="col-sm-3 col-xs-3"> Description <span class="text-danger">*</span></label>
                    <div class="col-md-6 col-sm-9 col-xs-9">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-info-sign"></i></span>
                            <textarea class="form-control" name="description" maxlength="255" placeholder="Please input product information here."></textarea>
                        </div>
                    </div>
                </div>


                <div class="form-group row">
                    <label class="col-sm-3 col-xs-3"> Category <span class="text-danger">*</span></label>
                    <div class="col-md-6 col-sm-9 col-xs-9" style="text-align: left;">
                        <label id="radio"><input name="category" type="radio" value="fashion" checked>Fashion</label>
                        <label id="radio"><input name="category" type="radio" value="electronics">Electronics</label>
                        <label id="radio"><input name="category" type="radio" value="homeAndGarden">Home and Garden</label>
                    </div>
                </div>



                <div class="form-group row">
                    <label class="col-sm-3 col-xs-3"> Product Photo <span class="text-danger">*</span></label>
                    <div class="col-md-5 col-sm-9 col-xs-9">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-paperclip"></i></span>
                            <input type='file' class="form-control" name="file" onchange="readURL(this);">
                        </div>
                    </div>
                </div>

                <div class="form-group row">
                    <label class="col-sm-3 col-xs-3"> Photo Preview </label>
                    <div class="col-md-5 col-sm-9 col-xs-9" style="text-align: left;">
                        <img id="photofile" src="" alt="your product photo" />
                    </div>
                </div>

                <hr>

                <div class="form-group">
                    <label class="col-sm-3 col-xs-3"></label>
                    <div class="col-md-5 col-sm-9 col-xs-9" id="buttonSet">
                        <button type="submit" class="btn btn-primary" id ="submit">Submit</button>
                        <button type="reset" class="btn btn-primary" id="reset">Clear</button>
                    </div>
                </div>

            </div>
        </div>
    </form>
</body>
<c:import url="../html/footer.html"/>
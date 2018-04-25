<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel='stylesheet' type='text/css' href='css/thumbnail.css' >
<c:import url="../jsp/getheader.jsp"/>
</head>
<body>
    <div style="padding: 60px 0 70px 0;">
        <div class="container" style="padding-top: 20px;">
            <div class="row">

                <!--Start of thumbnails -->
                <ul class="thumbnails list-unstyled">
                    <li class="col-md-3 col-sm-6 col-xs-12">
                        <div class="thumbnail">
                            <div class="Product">
                                <a href="product.htm?productid=1">
                                    <img class=" img-rounded img-responsive"  src='http://placehold.it/300x200/'>
                                </a>

                                <div class="caption">
                                    <h3 id="ProductName">Product Name</h3>

                                    <p> Price:$12  </p>
                                    <div id="submitBtn">
                                        <a><button type="submit" class="btn btn-info food-btn" value=""><i class="	glyphicon glyphicon-plus"></i>Add to cart</button></a>&nbsp;
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>


                    <li class="col-md-3 col-sm-6 col-xs-12">
                        <div class="thumbnail">
                            <div class="Product">
                                <a href="https://www.w3schools.com">
                                    <img class=" img-rounded img-responsive"  src='http://placehold.it/300x200/'>
                                </a>

                                <div class="caption">
                                    <h3 id="ProductName">Product Name</h3>

                                    <p> Price:$12  </p>
                                    <div id="submitBtn">
                                        <a><button type="submit" class="btn btn-info food-btn" value=""><i class="	glyphicon glyphicon-plus"></i>Add to cart</button></a>&nbsp;
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>

                    <li class="col-md-3 col-sm-6 col-xs-12">
                        <div class="thumbnail">
                            <div class="Product">
                                <a href="https://www.w3schools.com">
                                    <img class=" img-rounded img-responsive"  src='http://placehold.it/300x200/'>
                                </a>

                                <div class="caption">
                                    <h3 id="ProductName">Product Name</h3>

                                    <p> Price:$12  </p>
                                    <div id="submitBtn">
                                        <a><button type="submit" class="btn btn-info food-btn" value=""><i class="	glyphicon glyphicon-plus"></i>Add to cart</button></a>&nbsp;
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>
                <!--End of thumbnails -->

            </div>
        </div>
    </div>
</body>
<c:import url="../html/footer.html"/>
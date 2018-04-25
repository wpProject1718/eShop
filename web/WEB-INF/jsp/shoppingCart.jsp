<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../jsp/getheader.jsp"/>
<link rel='stylesheet' type='text/css' href='css/cart.css' >
</head>

<body>

    <div style="padding: 50px 0 60px 0;">
        <div class="container">

            <div class="row">
                <div class="col-sm-5 col-xs-12"><h2>Shopping Cart </h2></div>
            </div>

            <hr/>

            <div class="list-group-item col-md-12 col-sm-6 col-xs-12">
                <!--Product Photo-->
                <div class="media col-md-4">
                    <figure class="pull-left">
                        <img class="media-object img-rounded img-responsive"  src="http://placehold.it/300x200/">
                    </figure>
                </div>

                <!--Info & Delete button-->
                <div class="col-md-8" style="padding-top:20px;">
                    <h3 class="list-group-item-heading">Product Name: aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</h3>
                    <br>
                    <h4 class="list-group-item-heading">Price: </h4>
                    <h4 class="list-group-item-heading" style="padding-top:5px;">Quantity: </h4>
                    <div class="col-md-11">
                        <h4 class="list-group-item-heading" style="padding-top:0px;">Sub-total: $ </h4>
                    </div>
                    <div class="col-md-1">
                        <button type="button" class="btn btn-warning btn-md"><span class="glyphicon glyphicon-trash"></span> Delete </button>
                    </div>
                </div>
                <!--End of one item-->
            </div>
            
             <hr class="col-sm-12 col-xs-12" id="line">

            <div class="list-group-item col-md-12 col-sm-6 col-xs-12">
                <!--Product Photo-->
                <div class="media col-md-4">
                    <figure class="pull-left">
                        <img class="media-object img-rounded img-responsive"  src="https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/CityU_logo_2015.svg/1280px-CityU_logo_2015.svg.png">
                    </figure>
                </div>

                <!--Info & Delete button-->
                <div class="col-md-8" style="padding-top:20px;">
                    <h3 class="list-group-item-heading">Product Name: aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</h3>
                    <br>
                    <h4 class="list-group-item-heading">Price: </h4>
                    <h4 class="list-group-item-heading" style="padding-top:5px;">Quantity: </h4>
                    <div class="col-md-11">
                    <h4 class="list-group-item-heading" style="padding-top:5px;">Sub-total: $ </h4>
                    </div>
                    <div class="col-md-1">
                        <button type="button" class="btn btn-warning btn-md"><span class="glyphicon glyphicon-trash"></span> Delete </button>
                    </div>
                </div>
                <!--End of one item-->
            </div>

            <hr class="col-sm-12 col-xs-12">

            <!--Bottom Info.-->
            <div class="list-group-item">
                <div class="col-md-11 col-sm-7" id="total">
                    <h2 class="list-group-item-heading"><b>Total: $</b></h2>
                </div>
                <div class="col-md-1 col-sm-5" id="pay">
                    <button type="submit" class="btn btn-info btn-lg"><span class="glyphicon glyphicon-usd"></span> Purchase </button>
                </div>
            </div>

        </div>
    </div>

</body>
<c:import url="../html/footer.html"/>
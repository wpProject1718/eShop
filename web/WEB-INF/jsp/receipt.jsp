<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../jsp/getheader.jsp"/>
<link rel='stylesheet' type='text/css' href='css/receipt.css' >
</head>

<body>

    <div style="padding: 50px 0 60px 0;">
        <div class="container">
            <div class="row">

                <div id="receipt">
                    <h2 class="text-primary"><b>Receipt</b></h2>
                </div>

                <div id="receipt">
                    <h5>(Receipt No. : 001)</h5>
                </div>



                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>Product</th>
                            <th class="text-center">Quality</th>
                            <th class="text-center">Price</th>
                            <th class="text-center">Sub-total</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="col-md-9"><h4><em>Baked Rodopa Sheep Feta</em></h4></td>
                            <td class="col-md-1" style="text-align: center"> 2 </td>
                            <td class="col-md-1 text-center">$13</td>
                            <td class="col-md-1 text-center">$26</td>
                        </tr>
                        <tr>
                            <td class="col-md-9"><h4><em>Lebanese Cabbage Salad</em></h4></td>
                            <td class="col-md-1" style="text-align: center"> 1 </td>
                            <td class="col-md-1 text-center">$8</td>
                            <td class="col-md-1 text-center">$8</td>
                        </tr>
                        <tr>
                            <td class="col-md-9"><h4><em>Baked Tart with Thyme and Garlic</em></h4></td>
                            <td class="col-md-1" style="text-align: center"> 3 </td>
                            <td class="col-md-1 text-center">$16</td>
                            <td class="col-md-1 text-center">$48</td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td class="text-right"><h3><b>Total:</b></h3></td>
                            <td class="text-center text-danger"><h3><b>$123</b></h3></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>


</body>
<c:import url="../html/footer.html"/>
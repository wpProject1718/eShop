<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../jsp/getheader.jsp"/>
<link rel='stylesheet' type='text/css' href='css/cart.css' >
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            $(':button').click(function () {
				var but_name = $(this).attr("id").split("_");
				if(but_name[0] == "RemoveProduct"){
					var target = but_name[1];
					alert("uid=" +$("#userid").val()+"&pid="+but_name[1]);
					$.ajax({
                        type: "post",
                        url: "removecart.jsp", //this is my servlet
                        data: "uid=" +$("#userid").val()+"&pid="+but_name[1],
                        success: function(msg){      
                            $("#response").html(msg);
							
                        }
                    });
				}
				
				
            });
        });
    </script>
<body>
<%
    Connection conn = null;
	Statement stmt = null;
	try {
		Class.forName("com.mysql.jdbc.Driver").newInstance();
	} catch (Exception E) {}
	try {
		conn = DriverManager.getConnection(
			"jdbc:mysql:///db?user=root&password=");
		stmt =  conn.createStatement(
					ResultSet.TYPE_SCROLL_SENSITIVE,  
					ResultSet.CONCUR_UPDATABLE); 
	} catch (SQLException E) {
		out.println("Cannot connect db!");
	}
	double total = 0;
%>
    <div style="padding: 50px 0 60px 0;">
        <div class="container">

            <div class="row">
                <div class="col-sm-5 col-xs-12"><h2>Shopping Cart </h2></div>
            </div>

            <hr/>
			<div class="list-group-item col-md-12 col-sm-6 col-xs-12">
			<%
			if(session.getAttribute("userid")!= null){
				ResultSet rs = stmt.executeQuery("select product.product_id, product.product_name, product.product_price, product.product_img, cart_temp.product_num from product LEFT JOIN cart_temp ON product.product_id=cart_temp.product_id where cart_temp.user_id ='"+session.getAttribute("userid")+"'");
				
				while(rs.next())
				{   
					String pro_id = rs.getString("product_id");
					String pro_name = rs.getString("product_name");
					String pro_price = rs.getString("product_price");
					String pro_img = rs.getString("product_img");
					String pro_num = rs.getString("product_num");
					double subtotal = Double.parseDouble(pro_price)*Double.parseDouble(pro_num);
					<!--Product Photo-->
					out.println("<div class='media col-md-4'><figure class='pull-left'><img class='media-object img-rounded img-responsive' src='"+pro_img+"'></figure></div>")
					
					<!--Info & Delete button-->
					out.println("<div class='col-md-8' style='padding-top:20px;'><h3 class='list-group-item-heading'>Product Name: "+pro_name+"</h3><br>");
					out.println("<h4 class='list-group-item-heading'>Price:"+pro_price+"</h4>");
					out.println("<h4 class='list-group-item-heading' style='padding-top:5px;'>Quantity:"+pro_num+"</h4>");
					out.println("<div class='col-md-11'><h4 class='list-group-item-heading' style='padding-top:0px;'>Sub-total: $"+subtotal+"</h4></div>");
					out.println("<div class='col-md-1'><button type='button' class='btn btn-warning btn-md' id='RemoveProduct_"+ pro_id+ "'><span class='glyphicon glyphicon-trash'></span> Delete </button></div></div>");


//					out.println("<td><input type='button' value='Remove' id='RemoveProduct_"+ pro_id+ "'/></td></tr>");
					total += Double.parseDouble(pro_price)*Double.parseDouble(pro_num);
                <!--End of one item-->
				}				
				<!--Bottom Info.-->
				out.println("<div class='list-group-item'><div class='col-md-11 col-sm-7' id='total'><h2 class='list-group-item-heading'><b>Total: $"+total+"</b></h2></div>");
				out.println("<div class='col-md-1 col-sm-5' id='pay'><button type='submit' class='btn btn-info btn-lg' id='Purchase'><span class='glyphicon glyphicon-usd'></span> Purchase </button></div></div>");

//				out.println("Total: $"+total);
				out.println("<input type='hidden' id='userid' value='" + session.getAttribute("userid") + "'/>");
				out.println("<div id='response'></div>");
				
            
			"<div class='col-md-1 col-sm-5' id='pay'><button type='submit' class='btn btn-info btn-lg' id='Purchase'><span class='glyphicon glyphicon-usd'></span> Purchase </button></div></div>"
				
				
				
			}else{
				out.println("<marquee>What you find here are not existed~</marquee>");
			}
			%>
        </div>
    </div>

</body>
<c:import url="../html/footer.html"/>
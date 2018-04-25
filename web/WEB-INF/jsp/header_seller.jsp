<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import = "java.io.*,java.util.*" %>
<html>
    <head>
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
	%>
        <title> Shalala </title>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"  crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="css/header.css">
        <link rel="stylesheet" type="text/css" href="css/footer.css">
        <link rel='stylesheet' type='text/css' href='css/home.css' >
        <script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js" ></script>
        
    <header class="header">
        <div class="navbar-wrapper">
            <div class="container-fluid">
                <nav class="navbar navbar-fixed-top">
                    <div class="container">

                        <!--Header for tablet & smartphone -->
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <a class="navbar-brand" href="home.htm">Shalala</a>
                        </div>

                        <div id="navbar" class="navbar-collapse collapse ">

                            <ul class="nav navbar-nav">
                                <li><a href="home.htm"><span class="glyphicon glyphicon-home"></span>Home</a></li>
                                <li class=" dropdown">
                                    <a href="#" class="dropdown-toggle active" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Categories<span class="caret"></span></a>
                                    <ul class="dropdown-menu" id="drop">
                                      <%
                                        ResultSet rset = stmt.executeQuery("select * from category ORDER BY cat_id ASC");

                                        while(rset.next())
                                        {  
                                                out.println("<li><a href='category.htm?category="+rset.getString("cat_id")+"'>"+rset.getString("cat_name") +"</a></li>");
                                        }
                                        %>
                                    </ul>
                                </li>
                            </ul>


                            <ul class="nav navbar-nav pull-right">
                                <li><a href="" >Seller</a></li>
                                <!--<li><a href="seller_modify.htm" >Modify Shops</a></li>-->
                                <li><a href="seller_create.htm" >Create Product</a></li>
                                <!--<li><a href="seller_product.htm" >Manage Products</a></li>-->
                                <li><a href="logout.htm" >Logout</a></li>

                            </ul>

                        </div>
                    </div>
                </nav>
            </div>
        </div>
    </header>
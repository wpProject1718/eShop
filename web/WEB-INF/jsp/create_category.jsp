
<html>
<head>
<title>Add New Category</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            $("#submit").click(function () {
                name = $("#name").val();
                if (name == "") {
                	alert("Empty field. Please correct it.");
                } else {
					 $.ajax({
                        type: "post",
                        url: "createcatsuccess.jsp", //this is my servlet
                        data: "name=" +name,
                        success: function(msg){      
                            $("#response").html(msg);
                            $("#category").reset();
                        }
                    });
					//$("#category").submit();
                }
            });
        });
    </script>
<body>
	<form method="POST" id="category">
    	<table>
        	<tr>
            	<td>Category name</td>
                <td><input name="pro_name" type="text" id="name"/></td>
            </tr>
           	<tr>
            	<td></td>
                <td>
                	<input type="button" value="Create Product" id="submit"/>
					<input type="reset" value="Reset" id="reset"/>
                </td>
            </tr>
            <tr>
                <td colspan='2'>
                    <div id="response"></div>
                </td>
            </tr>
        </table>
	</form>	
</body>
</html>
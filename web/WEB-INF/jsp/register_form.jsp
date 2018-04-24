<!DOCTYPE html>
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            $("#submit").click(function () {
                name = $("#user_name").val();
                pw = $("#user_pw").val();
                if ($("#name").val() == "" || $("#pw").val() == "") {
                        alert("Empty field. Please correct it.");
                } else {
                    $.post("register.jsp",
                    {
                        name: name,
                        pw: pw
                    },
                    function (data) {
                        $("#response").html(data);
                    });
                    $("#register")[0].reset();
                }
            });
        });
    </script>
</head>

<body>
<form id="register"><table width="200" border="1">
  <tr>
    <td>
    	<label for="user_name">User name: </label></td>
    <td>
    	<input type="text" name="user_name" id="user_name" /></td>
  </tr>
  <tr>
    <td>
  	  <label for="user_pw">Password: </label></td>
    <td>
    	<input type="password" name="user_pw" id="user_pw" /></td>
  </tr>
   <tr>
    <td></td>
    <td>
    	<input name="but_reg" type="button" value="Register" id="submit"/>
        <input name="but_re" type="reset" value="Reset" />
    
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
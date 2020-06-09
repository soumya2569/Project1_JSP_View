<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
</head>
<body>
JSP PAGE: Hello ${name}
<form>
<label>Name:</label>
<input type="text" id="name"/>
<label>Purpose:</label>
<input type="text" id="purp"/>
<input type="button" onclick="ajax()" value="submit"/>
</form>
<div id="data"></div>
<script>
var user = {};
function ajax() {
    if (document.getElementById("name").value == "" || document.getElementById("purp").value == "") {
        alert("All Fields are mandatory")
        return;
    }
    else {
        user.username = document.getElementById("name").value;
        user.password = document.getElementById("purp").value;
        $.ajax({
            type: 'POST',
            data: JSON.stringify(user),
            crossDomain: true,
            dataType: 'json',
            contentType: 'application/json',
            url: "http://localhost:8081/message",
            success: function (result) {
                var obj = {};
                obj = result;
                alert("Authentication Successful");
                $("#data").html("<p>You have been granted access with access code " + obj.messageCode + "</p><p>Access description: " + obj.messageDesc + "</p><br>");
            },
            error: function (err) {
                console.log(err);
            }

        });

    }
}
</script>
</body>
</html>
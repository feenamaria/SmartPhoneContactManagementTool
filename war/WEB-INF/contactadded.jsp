<%@page import="com.google.appengine.api.datastore.PhoneNumber"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
function call_function(click)
{
	document.getElementById('name').value=click; 
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
</head>
<body background="xx.jpg">
<a href="/view.html" target = "body">
<img src="home.png" height="35" width="75" align="right"/></a>
<strong>Successfully added. </strong><br>
<strong>Thanks!!</strong><br>
<form  action="/search2.html" target='body' method='post'>
Click here to view contact 
<button id=${contactname} name=${contactname} onclick='call_function(this.id)'>
${contactname}</button>
<input type="text" id='name' name='name' style="visibility:hidden"/>
</form>
</body>
</html>
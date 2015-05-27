<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<style>
table td {
    border: 10px white;
    text-align: left; 
    
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
<script type="text/javascript">
function call_function(click)
{
	document.getElementById('name').value=click; 
}
</script>
</head>
<strong><h3><u>Contacts</u></h3></strong>
<body background="xx.jpg" text="black">
<form action="/search2.html" target='body' method='post' >
<table>
<c:forEach items="${contacts}" var="contact">
<tr>
<td><img src="contact.png" height="25" width="25"/></td>
<td><button id=${contact.firstName} onclick='call_function(this.id)'>
${contact.firstName}${contact.lastName}</button></td>
</tr>
</c:forEach>
</table>
<input type="text" id='name' name='name' style="visibility:hidden"/>
</form>
</body>
</html>

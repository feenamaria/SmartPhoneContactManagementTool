<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
<body background="xx.jpg" text="black">
<form action="/deletegroup1.html" target='body' method='post' >
<a href="/group.html" target="body"> <img src="home.png" height="35" width="75" align="right" /> </a>
<strong><h3><u>Delete groups</u></h3></strong>
<table>
<c:forEach items="${groups}" var="group">
<tr>
<td><input type="checkbox" value='${group.groupName}' name="groupname">
<td><img src="unnamed.png" height="25" width="25"/></td>
<td><button id='${group.groupName}' onclick='call_function(this.id)'>
${group.groupName}</button></td>
<td></td><td></td><td></td>
<td><em><strong><font size="4">${fn:length(group.memberNames)}</font></strong></em></td>
</tr>
</c:forEach>
</table>
<input type="text" id='name' name='name' style="visibility:hidden"/>
<br><br><input type="submit" value="Delete" align="left" >
</form>
</body>
</html> 

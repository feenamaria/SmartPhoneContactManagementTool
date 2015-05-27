<%@page import="com.google.appengine.api.datastore.PhoneNumber"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
</head>
<body background="xx.jpg">
<a href="/group.html" target = "body">
<img src="home.png" height="35" width="75" align="right"/></a>
<strong><h3>Add new Group.</h3></strong>
<form action="/add1.html" target="body" method="post" >
<strong>Group Name:</strong><input type="text" name="name"><br><br>
<strong>Group Members:</strong>
<c:forEach items="${contacts}" var="contact">
<table>
<tr> 
<td><input type="checkbox" name="members" value="${contact.firstName}"><img src="contact.png" height="25" width="25"/></td><td>
${contact.firstName}</td> </tr>
</table>
</c:forEach>
<br>
<strong>Wallpaper:</strong> 
	<select name="wp">
		<option value="wall0">Default</option>
		<option value="wall1">Wall1</option>
		<option value="wall2">Wall2</option>
		<option value="wall3">Wall3</option>				
	</select>
&nbsp;&nbsp;&nbsp;&nbsp;
<strong>Ring Tone:</strong> 
	<select name="rt">
		<option value="RingTone0">Default</option>
		<option value="RingTone1">RingTone1</option>
		<option value="RingTone2">RingTone2</option>
		<option value="RingTone3">RingTone3</option>				
	</select>
<br><br>

<input type="submit" align="middle" value="DONE"/>
&nbsp;
</form>
</body>
</html>




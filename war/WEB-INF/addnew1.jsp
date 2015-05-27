<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body background="xx.jpg" text="black">
<form action="/search1.html" target = "body" method="post">
<input type="search" name="name" placeholder="Find contact" onkeydown="if (event.keyCode == 13) document.getElementById('btnSearch').click()"/>
<input type="submit" value="Search"/> 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="/addnew.html" target = "body">
<img src="addcon.png" title="Add Contact" height="35" width="35"/></a>
&nbsp; <a href="/deleteContactView.html" target = "body">
<img src="delete.jpg" title="Delete" height="35" width="35"/></a>
</form>
</body>
</html>


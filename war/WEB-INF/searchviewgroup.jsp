<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
</head>
<body>
<body background="xx.jpg">
<c:forEach items="${groups}" var="group">

<form action="deletesinglegroup.html" method="post" target="body">
    <a href="javascript:;" onclick="parentNode.submit();">
    <img src="deletegroup.png" title="Delete group"height="40" width="40" align="right"/></a>
    <input type="hidden" name="name" value='${group.groupName}'>
</form>

<img src="unnamed.png" height="25" width="25"/>
<strong><u>${group.groupName}</u></strong><br><br>
<c:if test="${fn:length(group.memberNames) != 0}">  
<strong>Members:</strong>
<c:forEach var="ite" begin="0" end="${fn:length(group.memberNames)-1}">
   <br><em>${group.memberNames[ite]}</em>
</c:forEach>
</c:if>
<br><br><strong>Wall Paper:</strong><em>${group.wallPaper}<br></em>
<br><strong>Ring Tone:</strong><em>${group.ringTone}<br></em>
<br><strong>Member Count:</strong>${fn:length(group.memberNames)}<br>
</c:forEach>
</body>
</html>





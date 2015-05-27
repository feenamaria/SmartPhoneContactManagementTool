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
<body background="xx.jpg" text="black">
<a href="/view.html" target = "body">
<img src="home.png" height="35" width="75" align="right"/></a>
<c:forEach items="${contacts}" var="contact">
<form action="delete1.html" method="post" target="body">
    <a href="javascript:;" onclick="parentNode.submit();">
    <img src="deleteicon.jpg" title="Delete contact"height="35" width="35" align="right"/></a>
    <input type="hidden" name="name" value='${contact.firstName}'>
</form>
<form action="editcontact.html" method="post" target="body">
    <a href="javascript:;" onclick="parentNode.submit();">
    <img src="edit.png" title="Edit contact"height="35" width="35" align="right"/></a>
    <input type="hidden" name="name" value='${contact.firstName}'>
</form>

<img src="contact.png" height="25" width="25"/>
<strong><u>${contact.firstName}${contact.lastName}</u></strong>

<c:if test="${fn:length(contact.phoneNumber) != 0}">  
<br><br><strong>PhoneNumber:</strong>
<c:forEach var="ite" begin="0" end="${fn:length(contact.phoneNumber)-1}">
   <br>${contact.phoneType[ite]} : <em>${contact.phoneNumber[ite]}</em>
</c:forEach>
</c:if>

<c:if test="${fn:length(contact.emailId) != 0}">
<br><br><strong>EmailId:</strong>
<c:forEach var="ite" begin="0" end="${fn:length(contact.emailId)-1}">
   <br>${contact.emailType[ite]} : <em>${contact.emailId[ite]}</em>
</c:forEach>
</c:if>

<c:if test="${fn:length(contact.address) != 0}">
<br><br><strong>Address:</strong>
<c:forEach var="ite" begin="0" end="${fn:length(contact.address)-1}">
   <br>${contact.addressType[ite]} : <em>${contact.address[ite]}</em>
</c:forEach>
</c:if>

<c:if test="${fn:length(contact.groups) != 0}">
<br><br><strong>Groups:</strong>
<c:forEach var="ite" begin="0" end="${fn:length(contact.groups)-1}">
   <em><br>${contact.groups[ite]}</em>
</c:forEach>
</c:if>
<br><br><strong>Message Alert: </strong><em>${contact.messageAlert}</em>
<br><strong>Ring Tone: </strong><em>${contact.ringTone}</em>
<br><strong>Vibration Pattern: </strong><em>${contact.vibrationPattern}</em>
<tr>
</c:forEach>

</body>
</html> 




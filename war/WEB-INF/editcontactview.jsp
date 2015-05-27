<%@page import="com.google.appengine.api.datastore.PhoneNumber"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
<script>
function generateRow(divName, innerHtml) {
var newdiv = document.createElement('div'); 
newdiv.innerHTML=innerHtml;
document.getElementById(divName).appendChild(newdiv); 
}
</script>
</head>
<body background="xx.jpg" text="black" scrolling="auto">
	<a href="/view.html" target="body"> <img src="home.png" height="35" width="75" align="right" /> </a>
	<form action="/add.html" target="body" method="post">
	<h3><strong><u>Update Contact</u></strong></h3>
		<strong>First Name:</strong><input type="text" name="name" value='${contact.firstName}' required>
		<br><br> <strong>Last Name:</strong><input type="text"
			name="lname" value='${contact.lastName}'><br> <br><strong>Phone:&nbsp;</strong>	
		<br>
		
<c:if test="${fn:length(contact.phoneNumber) != 0}">  
<c:forEach var="ite" begin="0" end="${fn:length(contact.phoneNumber)-1}">
<br><input type="text" name="phoneNumber" value='${contact.phoneNumber[ite]}'> <select
				name="phoneType" id="pt">
				<option value="mobile" ${(contact.phoneType[ite] == 'mobile') ? "selected":""} >Mobile</option>
				<option value="work" ${(contact.phoneType[ite] == 'work') ? "selected":""} >Work</option>
				<option value="home" ${(contact.phoneType[ite] == 'home') ? "selected":""} >Home</option>
				<option value="other" ${(contact.phoneType[ite] == 'other') ? "selected":""} >Other</option>
			</select><br>
</c:forEach>
</c:if>
		
	<br>	<input type="text" name="phoneNumber"> <select
				name="phoneType" id="pt">
				<option value="mobile">Mobile</option>
				<option value="work">Work</option>
				<option value="home">Home</option>
				<option value="other">Other</option></select>
		<br>
		<div id="dynamicInputPhoneNumber"></div>
		
			<input type="button" value="Add New"
				onclick="generateRow('dynamicInputPhoneNumber', &#034<p><input type='text' name='phoneNumber'> <select name='phoneType'><option value='mobile'>Mobile</option><option value='work'>Work</option><option value='home'>Home</option><option value='other'>Other</option></select>&#034)" />
		<br>
		<br> <strong>EmailId:&nbsp;</strong>
		

<c:if test="${fn:length(contact.emailId) != 0}">  
<c:forEach var="ite" begin="0" end="${fn:length(contact.emailId)-1}">
			<br><input type="text" name="emailId" value='${contact.emailId[ite]}'> <select name="emailType">
				<option value="personal" ${(contact.emailType[ite] == 'personal') ? "selected":""} >Personal</option>
				<option value="office" ${(contact.emailType[ite] == 'office') ? "selected":""} >Office</option>
				<option value="home" ${(contact.emailType[ite] == 'home') ? "selected":""} >Home</option>
				<option value="other" ${(contact.emailType[ite] == 'other') ? "selected":""} >Other</option>
			</select><br>
</c:forEach>
</c:if>

		<br>	<input type="text" name="emailId"> <select name="emailType">
				<option value="personal">Personal</option>
				<option value="office">Office</option>
				<option value="home">Home</option>
				<option value="other">Other</option></select>
		<br>
		<div id="dynamicInputMail"></div>
		
			<input type="button" value="Add New"
				onclick="generateRow('dynamicInputMail', &#034<p><input type='text' name='emailId'> <select name='emailType'><option value='personal'>Personal</option><option value='office'>Office</option><option value='home'>Home</option><option value='other'>Other</option></select>&#034)" />
		<br>
		<br> <strong>Address:&nbsp;</strong>
<c:if test="${fn:length(contact.address) != 0}">  
<c:forEach var="ite" begin="0" end="${fn:length(contact.address)-1}">
			<br><input type="text" name="address" value='${contact.address[ite]}'}'> <select name="addressType">
				<option value="home" ${(contact.addressType[ite] == 'home') ? "selected":""} >Home</option>
				<option value="office" ${(contact.addressType[ite] == 'office') ? "selected":""}>Office</option>
				<option value="other" ${(contact.addressType[ite] == 'other') ? "selected":""}>Other</option>
			</select><br>
</c:forEach>
</c:if>

<br><input type="text" name="address"> <select name="addressType">
				<option value="home">Home</option>
				<option value="office">Office</option>
				<option value="other">Other</option>
			</select>

		<br>
		<div id="dynamicAddress"></div>
			<input type="button" value="Add New"
				onclick="generateRow('dynamicAddress', &#034<p><input type='text' name='address'> <select name='addressType'><option value='home'>Home</option><option value='office'>Office</option><option value='other'>Other</option></select>&#034)" />
		<br> <strong>Groups:&nbsp;</strong><br> 
		<input type="checkbox" checked name="groups" value="mycontacts">mycontacts
		<c:forEach items="${groups}" var="group">
		<c:if test="${group.groupName != 'mycontacts'}">
		<input type="checkbox" name="groups" value='${group.groupName}'>${group.groupName}
		</c:if>
		</c:forEach>				
		<br><br> <strong>Message Alert: </strong> 
			<select name="messagealert">
				<option value="messagealert0" ${(contact.messageAlert == 'messagealert0') ? "selected":""}>Default</option>
				<option value="messagealert1" ${(contact.messageAlert == 'messagealert1') ? "selected":""}>alert1</option>
				<option value="messagealert2" ${(contact.messageAlert == 'messagealert2') ? "selected":""}>alert2</option>
				<option value="messagealert3" ${(contact.messageAlert == 'messagealert3') ? "selected":""}>alert3</option>				
			</select>
		<br> <br>
		<strong>Ring Tone:</strong> 
			<select name="rt">
				<option value="RingTone0" ${(contact.ringTone == 'RingTone0') ? "selected":""}>Default</option>
				<option value="RingTone1" ${(contact.ringTone == 'RingTone1') ? "selected":""}>RingTone1</option>
				<option value="RingTone2" ${(contact.ringTone == 'RingTone2') ? "selected":""}>RingTone2</option>
				<option value="RingTone3" ${(contact.ringTone == 'RingTone3') ? "selected":""}>RingTone3</option>				
			</select>
		<br> <br> 
		<strong>Vibration Pattern:</strong> 
			<select name="vp">
				<option value="VibrationPattern0" ${(contact.vibrationPattern == 'VibrationPattern0') ? "selected":""}>Default</option>
				<option value="VibrationPattern1" ${(contact.vibrationPattern == 'VibrationPattern1') ? "selected":""}>Pattern1</option>
				<option value="VibrationPattern2" ${(contact.vibrationPattern == 'VibrationPattern2') ? "selected":""}>Pattern2</option>
				<option value="VibrationPattern3" ${(contact.vibrationPattern == 'VibrationPattern3') ? "selected":""} >Pattern3</option>				
			</select><br><br>
			<strong>Add to favourites   </strong>
			<select name="isFavourite">
				<option value="false" ${(contact.isFavourite == 'false') ? "selected":""}>No</option>
				<option value="true" ${(contact.isFavourite == 'true') ? "selected":""}>Yes</option>
			</select><br>
		<br> <input type="submit"
			align="middle" value="DONE"  /> 
		&nbsp;  <input type="reset" align="middle" value="RESET" /> 

	</form>
</body>
</html>





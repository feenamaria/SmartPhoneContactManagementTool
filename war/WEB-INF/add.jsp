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
<body background="xx.jpg" text="black">
	<a href="/contacts.html" target="body"> <img src="home.png" height="35" width="75" align="right" /> </a>
	<form action="/add.html" target="body" method="post">
	<h3><strong><u>Create Contact</u></strong></h3>
	<table>
	<tr><td><strong>First Name:</strong></td><td><input type="text" name="name" required></td></tr>
	<tr><td><strong>Last Name:</strong></td><td><input type="text" name="lname"></td></tr>
	<tr><td><strong>Phone:</strong></td>
	<td><input type="number" name="phoneNumber" placeholder="phonenumber"></td><td>
	<select	name="phoneType" id="pt">
				<option value="mobile">Mobile</option>
				<option value="work">Work</option>
				<option value="home">Home</option>
				<option value="other">Other</option>
			</select></td></tr>
			<tr><td></td><td>
		<div id="dynamicInputPhoneNumber"></div></td></tr>
		<tr><td></td><td>
			<input type="button" value="Add New"
				onclick="generateRow('dynamicInputPhoneNumber', &#034<p><input type='number' name='phoneNumber' placeholder='phonenumber'> <select name='phoneType'><option value='mobile'>Mobile</option><option value='work'>Work</option><option value='home'>Home</option><option value='other'>Other</option></select>&#034)" />
	     </td></tr>
		<tr><td><strong>EmailId:</strong></td>
		<td><input type="email" name="emailId" placeholder="enter email"></td><td> <select name="emailType">
				<option value="personal">Personal</option>
				<option value="office">Office</option>
				<option value="home">Home</option>
				<option value="other">Other</option>
			</select></td></tr>
		<tr><td></td><td><div id="dynamicInputMail"></div></td></tr>
		<tr><td></td><td>
			<input type="button" value="Add New"
				onclick="generateRow('dynamicInputMail', &#034<p><input type='email' name='emailId' placeholder='enter email'> <select name='emailType'><option value='personal'>Personal</option><option value='office'>Office</option><option value='home'>Home</option><option value='other'>Other</option></select>&#034)" />
		</td></tr>
		<tr><td><strong>Address:</strong></td>
			<td><input type="text" name="address" placeholder="address"></td><td> <select name="addressType">
				<option value="home">Home</option>
				<option value="office">Office</option>
				<option value="other">Other</option>
			</select></td></tr>
		<tr><td></td><td><div id="dynamicAddress"></div></td></tr>
		<tr><td></td><td>
			<input type="button" value="Add New"
				onclick="generateRow('dynamicAddress', &#034<p><input type='text' name='address'> <select name='addressType'><option value='home'>Home</option><option value='office'>Office</option><option value='other'>Other</option></select>&#034)" />
		</td></tr>
		<tr><td><strong>Groups:</strong></td>
		<td><input type="checkbox" checked name="groups" value="mycontacts">mycontacts</td></tr>
		<tr><td></td><td>
		<c:forEach items="${groups}" var="group">
		<c:if test="${group.groupName != 'mycontacts'}">
		<input type="checkbox" name="groups" value='${group.groupName}'>${group.groupName}
		</c:if>
		</c:forEach></td></tr>				
		<tr><td><strong>MessageAlert: </strong></td>
			<td><select name="messagealert">
				<option value="messagealert0">Default</option>
				<option value="messagealert1">alert1</option>
				<option value="messagealert2">alert2</option>
				<option value="messagealert3">alert3</option>				
			</select></td></tr>
		<tr><td><strong>RingTone:</strong></td>
			<td><select name="rt">
				<option value="RingTone0">Default</option>
				<option value="RingTone1">RingT1</option>
				<option value="RingTone2">RingT2</option>
				<option value="RingTone3">RingT3</option>				
			</select></td></tr>
		<tr><td><strong>Vibration :</strong></td>
			<td><select name="vp">
				<option value="VibrationPattern0">Default</option>
				<option value="VibrationPattern1">Vipat1</option>
				<option value="VibrationPattern2">Vipat2</option>
				<option value="VibrationPattern3">Vipat3</option>				
			</select></td></tr>
			<tr><td><strong>Add to Favorites:</strong></td><td>
			<select name="isFavourite">
				<option value="false">No</option>
				<option value="true">Yes</option>
			</select></td></tr>
		<tr><td> <input type="submit"
			align="middle" value="DONE"  /> </td><td>
		&nbsp;  <input type="reset" align="middle" value="RESET" /></td></tr>

	</table>
	</form>	
</body>
</html>





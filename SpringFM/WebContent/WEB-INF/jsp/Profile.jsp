<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Profile</title>
	<jsp:include page="/links.jsp" />
</head>
<body>
	<div class="container text-center">
		<br>
		<h2>PROFILE</h2>
		<br><br>
		<a href="/Spring/Homepage" class="btn btn-outline btn-success" target="_parent">Display-Products</a>
		<a href="/SpringFM/AdminHome" class="btn btn-outline btn-primary" target="_parent">Admin Home</a>
		<br><br>
		<table class="table table-bordered table-striped table-hover table-responsive">
			<tbody>
				<tr>
					<th>ID</th>
					<td>${urPro.id }</td>
				</tr>
				<tr>
					<th>First Name</th>
					<td>${urPro.fname }</td>
				</tr>
				<tr>
					<th>Last Name</th>
					<td>${urPro.lname }</td>
				</tr>
				<tr>
					<th>Email</th>
					<td>${urPro.email }</td>
				</tr>
				<tr>
					<th>Contact</th>
					<td>${urPro.contact }</td>
				</tr>
				<tr>
					<th>City</th>
					<td>${urPro.city }</td>
				</tr>
				<tr>
					<th>Pincode</th>
					<td>${urPro.pincode }</td>
				</tr>
				<tr>
					<th>User</th>
					<td>${urPro.user }</td>
				</tr>
				<tr>
					<th>Admin</th>
					<td>${urPro.admin }</td>
				</tr>
				<tr>
					<th>FromBy</th>
					<td><a href="/SpringFM/profile/${urPro.fromBy }">${urPro.fromBy }</a></td>
				</tr>				
			</tbody>
		</table>
 	    	<br><input onclick="history.back()" class="btn btn-outline btn-black"  type="button" value=" BACK " /><br><br>     
		
	</div>
</body>
</html>
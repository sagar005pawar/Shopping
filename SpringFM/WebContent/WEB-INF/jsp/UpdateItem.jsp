<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page errorPage="error.jsp" language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<jsp:include page="/links.jsp" />
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"  />
	<title>Update-Item</title>
</head>
<body class="container">
<%
	if(session.isNew() || (session.getAttribute("userLog")!="login")) {
		response.sendRedirect("/SpringFM/AdminLogout");
	} 
%>
<center>
	<br><br><br>
	<div class="w3-card-4">
		<div class="w3-grey">
			<br><h2 style="font-family: Algerian">Product Updating</h2><br>		
		</div>
		<br>
		<div class="">
			<form action="/SpringFM/ItemUpdating" method="post" onsubmit="return confirm('Are you sure you want to Upadate this item?');">
				<table class="w3-table w3-centered w3-responsive">
					<tr>
						<th>Product_ID</th>
					    <th>Product Name</th>
					    <th>Type/Section</th>
						<th>Qty-Available</th>
						<th>Price</th>
					</tr>
					<tr>
						<td><input type="number" min="1" name="id" required="required" /></td>
						<td><input type="text" pattern="[a-zA-Z][a-zA-Z0-9\s]*" name="prName" required="required" /></td>
						<td><input type="text" pattern="[a-zA-Z][a-zA-Z0-9\s]*" name="type" required="required" /></td>
						<td><input type="number" min="1" name="QA" required="required" /></td>
						<td><input type="number" name="price" min=1 required="required" /></td>
					</tr>
				</table>
				<br>
				<input type="submit" class="btn btn-outline btn-black" name="btn1" value="Update Item" />
				<input type="reset" class="btn btn-outline btn-black" name="btn1" value="Clear" />
			</form>
	
			<br><br><br>
			<a href="/SpringFM/Homepage" class="btn btn-success" target="_parent">Display-Products</a>
			<a href="/SpringFM/AdminHome" class="btn btn-primary" target="_parent">Admin Home</a>
	
			<br><br><br>
			<h3>${msg }</h3>		
		</div>
	</div>
</center>
</body>
</html>
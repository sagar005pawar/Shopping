<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin List</title>
	<jsp:include page="/links.jsp" />
</head>
<body>

	<div class="container text-center">
		<br>
		<h2>${heading }</h2>
		<br><br><br>
	<a href="/Spring/Homepage" class="btn btn-outline btn-success" target="_parent">Display-Products</a>
	<a href="/SpringFM/AdminHome" class="btn btn-outline btn-primary" target="_parent">Admin Home</a>
	<br><br>
		
		<table class="table table-bordered table-striped table-hover table-responsive">
			<thead>
			<tr>
				<th>ID</th>
				<th>Fname</th>
				<th>Lname</th>
				<th>Email</th>
				<th>Contact</th>
				<th>City</th>
				<th>Pincode</th>
				<c:if test="${users[0].fromBy!=0 }">				
				<th>FromBy</th>						<!-- for suspended & admins  -->
				</c:if>
				<c:if test="${!users[0].admin }">				
				<th>Permission</th>						<!-- for suspended & new admins  -->
				</c:if>				
				<th>Removing</th>
			</tr>				
			</thead>
			<tbody>
			<c:forEach var="u" items="${users}" varStatus="status">
			<tr>
				<td>${u.id }</td>
				<td>${u.fname }</td>
				<td>${u.lname }</td>
				<td>${u.email }</td>
				<td>${u.contact }</td>
				<td>${u.city }</td>
				<td>${u.pincode }</td>
				<c:if test="${u.fromBy!=0 }">
				<td><a href="/SpringFM/profile/${u.id }">${u.fromBy }</a></td>
				</c:if>
				<c:if test="${!u.admin }">
				<td><a href="/SpringFM/AdminApprove/${u.id }/${user.id }">Approval</a></td>
				</c:if>
				<c:if test="${u.admin}">
				<td><a href="/SpringFM/AdminUnApproval/${u.id }/${u.fromBy }">Ignore</a></td>
				</c:if>
				<c:if test="${!u.admin }">
				<td><a href="/SpringFM/AdminRemoved/${u.id }">Ignore</a></td>
				</c:if>				
			</tr>
			</c:forEach>
			</tbody>
		</table>
		
				<div class="msgerr" >
			<label>${msg }</label>
		</div>
		
		
	</div>
	


</body>
</html>
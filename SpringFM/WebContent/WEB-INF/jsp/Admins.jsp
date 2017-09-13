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
		<div class="productheading">${heading }</div>
		<br><br>
	<a href="/SpringFM/Homepage" class="btn btn-outline btn-success" >Display-Products</a> 
	<label style="display: inline; font-size: 15px; margin: 0px 10px 0px 10px;"><a class="" href="/SpringFM/newAdmins">NEW ADMINS</a> | 
	<a class="" href="/SpringFM/Suspended">Suspended</a> | 
	<a class="" href="/SpringFM/Admins">ADMINS</a></label>
	<a href="/SpringFM/AdminHome" class="btn btn-outline btn-primary">Admin Home</a>
	<a class="btn btn-warning" href="/SpringFM/AdminLogout">Logout </a>
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
				<c:if test="${!u.admin && u.fromBy!=0}">
				<td><a href="/SpringFM/AdminApprove/${u.id }/${user.id }">Approval</a></td>
				</c:if>				
				<c:if test="${!u.admin && u.fromBy==0}">
				<td><a href="/SpringFM/NewAdminApprove/${u.id }/${user.id }">Approval</a></td>
				</c:if>								
				<c:if test="${u.admin && u.fromBy!=0}">
				<td><a href="/SpringFM/AdminUnApproval/${u.id }/${u.fromBy }">Ignore</a></td>
				</c:if>
				<c:if test="${!u.admin && u.fromBy!=0}">
				<td><a href="/SpringFM/SuspendAdminRemoved/${u.id }">Ignore</a></td>
				</c:if>				
				<c:if test="${!u.admin && u.fromBy==0}">
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
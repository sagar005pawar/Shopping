<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.model.Products"%>
<%@ page errorPage="error.jsp" language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<jsp:include page="/links.jsp" />
	<title>Products List</title>
</head>
<body class="container-fluid products" ng-app="myApp" ng-controller="uProducts">
<%
	//Back Button Cache Disable
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Expires", "0");				

	if(session.isNew() || (session.getAttribute("userLog")!="login")) {
		response.sendRedirect("/SpringFM/AdminLogout");
	} 
%>

<center>
	<div class="productheading">
		${type } Items
	</div>
	<form action="/SpringFM/LatestCommander" method="post">
	<table class="productsTable" frame="hsides">
		<thead>
		<tr style="font-size: 20px;">
			<th><a href="/SpringFM/sortList/id/admin/${type }">Product-ID</a></th>
			<th><a href="/SpringFM/sortList/name/admin/${type }">Product-Name</a></th>
			<th><a href="/SpringFM/sortList/qty/admin/${type }">Quantity-Available</a></th>
			<th><a href="/SpringFM/sortList/price/admin/${type }">Price(per-Qty.)</a></th>
			<th><label style="margin-left: 18%;"><a><u>Editing</u></a></label></th>
			<th><label style="margin-left: 18%;"><a><u>Remove</u></a></label></th>			
		</tr>		
		</thead>		
		<tbody>
		<tr></tr><tr></tr>	
		<c:forEach var="p" items="${asi}" varStatus="status">
		<tr style="font-size: 18px;">
			<td>${p.id}</td>
			<td>${p.prName }</td>
			<td>${p.QA }</td>
			<td>${p.price }</td>
			<td><a class="btn btn-lg btn-link" target="frame3" href="/SpringFM/UpdateItem/${p.id}/${p.prName }/${p.type}/${p.QA }/${p.price }" target="_parent" >${p.prName }</a></td>			
			<td><a onclick="return confirm('Are you sure you want to delete ${p.prName } item?');" class="btn btn-outline btn-danger" href="/SpringFM/LinkItemDeletion/${p.id}" target="_parent" >${p.prName }</a></td>
		</tr>
		</c:forEach>
		</tbody>
	</table>
</form>
	
<form action="/SpringFM/AdminHome" target="_parent">
	<div><a target="frame3" href="/SpringFM/InsertItem/${type }" class="btn btn-success" type="submit" name="btn3" align="middle" >Insert Item</a>
	<input class="btn btn-success" type="submit" name="btn3" value="Admin Home" align="middle" /></div>
</form>
<br>
<form action="/SpringFM/LinkSectionDeletion/${type }" method="post" target="_parent">
	<h4><input style="margin-bottom: 7%;" onclick="return confirm('Are you sure you want to delete ${type } section?');" class="btn btn-danger" type="submit" name="btn3" value="${type } Section Delete" align="middle" /></h4>
</form>
</center>

</body>
</html>


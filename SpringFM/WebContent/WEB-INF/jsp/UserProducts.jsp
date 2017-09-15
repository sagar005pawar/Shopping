<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@page import="java.util.*"%>
<%@page import="com.model.*"%>
<%@ page import="rest.ProductForm" %>
<%@ page errorPage="error.jsp" language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<jsp:include page="/links.jsp" />
	<title>User Products</title>
</head>
<body class="container" ng-app="myApp" ng-controller="uProducts">
<%
	if(session.isNew() || (session.getAttribute("userLog")!="login")) {
		response.sendRedirect("/SpringFM/logout");
	} 
%>
<center>
	
	<div class="productheading">
		${type} Items
	</div>
	
	<form:form action="/SpringFM/LatestCommander" method="post" modelAttribute="ProductForm">

	<table frame="hsides" style="width: 75%; margin-bottom: 35px;">
	<tr style="font-size: 13px;">
		<th><label style="margin-left: 8%;"><a href="/SpringFM/sortList/name/user/${type}">Name</a></label></th>
		<th><label style="margin-left: 58%;"><a href="/SpringFM/sortList/qty/user/${type}">Qty.</a></label></th>
		<th></th>
		<th><label style="margin-left: 50%;"><a href="/SpringFM/sortList/price/user/${type}">Price</a></label></th>		
	</tr>
		<c:forEach var="p" items="${asi}" varStatus="status">
			<tr style="text-align: center; text-transform: capitalize; font-family: Poor Richard;" >
				<th><h3>${p.prName }:</h3></th>
				<td>Available:<strong> <label style="color: blue; font-size: 20px;">${p.QA }</label></strong>
				<td>Quantity Selected:<input type="number" name="prodList[${status.index}].QN" min=0 max=${p.QA } size="5" value="0" /></td>
				<td>Price: <strong><label style="font-size: 20px;color: green;"> ${p.price}</label></strong>
					
				<input type="hidden" name="prodList[${status.index}].prName" value="${p.prName }" />
				<input type="hidden" name="prodList[${status.index}].QA"  value="${p.QA }" size="5"></td>
				<input type="hidden" name="prodList[${status.index}].type" value="${p.type}" />
				<input type="hidden" name="prodList[${status.index}].price" size="5" ng-model="price" value="${p.price }"></td>
			</tr>
		</c:forEach>
	</table>
	<div style="margin-bottom: 7%;"><input class="btn btn-primary" type="submit" value="Take">  <input class="btn btn-primary" type="reset" value="Clear"></div>
</form:form>	
</center>
</body>
</html>
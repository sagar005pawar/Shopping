<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page errorPage="error.jsp" language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<jsp:include page="/links.jsp" />
	<title>Update-Item</title>
</head>
<body class="container">
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
	<form action="/SpringFM/UpdateProduct" method="post" onsubmit="return confirm('Are you sure you want to Update ${prname } item?');">
	<br><h2 style="font-family: Algerian">Product Updating</h2><br><br>
	<table style=" text-align: center">
		<thead>
		<tr>
			<th>Pr_ID</th>
		    <th>Product Name</th>
		    <th>Type/Section</th>
			<th>Qty-Available</th>
			<th>Price</th>
		</tr>		
		</thead>
		<tbody>
		<tr>
			<td align="center"> <input id="id" type="number" name="id" align="middle" value="${pro.id }" required="required" /></td>
			<input type="hidden" name="id" value=${pro.id } required="required" /></td>
			<input type="hidden" name="prName" value=${pro.prName } required="required" /></td>
			<input type="hidden" name="type" value=${pro.type } required="required" /></td>
	 		<td align="center"> <input id="name" type="text" name="prName" align="middle" value="${pro.prName }" required="required" /></td>
			<td align="center"> <input id="type" type="text" name="type" align="middle" value="${pro.type }" required="required" /></td>
			<td align="center"> <input type="number" name="QA" align="middle" value=${pro.QA } required="required" /></td>
			<td align="center"> <input type="number" name="price" min=1 align="middle" value=${pro.price } required="required" /></td>
		</tr>
		</tbody>
	</table>
<br>
	<input type="submit" class="btn btn-outline btn-black" name="btn1" value="Update Item" align="middle" />
</form>

	<br><br><br>
	<a href="/SpringFM/Homepage" class="btn btn-outline btn-success" target="_parent">Display-Products</a>
	<a href="/SpringFM/AdminHome" class="btn btn-outline btn-primary" target="_parent">Admin Home</a>
	
		<br><br><br><br><h3>${msg }</h3>

</center>
<script>
	$(document).ready(function(){
		if($("#id").val()!=''){
			$("#id").attr('disabled', 'disabled');
		}
		if($("#name").val()!=''){
			$("#name").attr('disabled', 'disabled');
		}
		if($("#type").val()!=''){
			$("#type").attr('disabled', 'disabled');
		}

	});
</script>
</body>
</html>
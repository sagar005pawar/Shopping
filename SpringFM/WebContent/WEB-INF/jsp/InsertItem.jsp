<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page errorPage="error.jsp" language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<jsp:include page="/links.jsp" />
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"  />	
<title>Insert Item</title>
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
			<br><h2 style="font-family: Algerian">Product Inserting</h2><br>		
		</div>
		<br>		
		<form action="/SpringFM/ItemInserting" method="post" onsubmit="return confirm('Are you sure you want to Insert the item?');">
			<table class="w3-table w3-centered w3-responsive">
				<tr>
				    <th>Type/Section</th>
				    <th>Product Name</th>
					<th>Qty-Available</th>
					<th>Price</th>
				</tr>
				<tr>
				<c:if test="${type=='' || type==null}">
					<td align="center"> <input pattern="[a-zA-Z][a-zA-Z0-9\s]*" type="text" name="type" align="middle" required="required" /></td>
				</c:if>	
				<c:if test="${type!='' && type!=null}">
					<input type="hidden" name="type" value="${type }" required="required" /></td>
					<td align="center"> <input pattern="[a-zA-Z][a-zA-Z0-9\s]*" value="${type }" type="text" id="type" name="type" align="middle" required="required" /></td>
				</c:if>
					<td align="center"> <input pattern="[a-zA-Z][a-zA-Z0-9\s]*" type="text" name="prName" align="middle" required="required" /></td>
					<td align="center"> <input type="number" min="1" name="QA" align="middle" required="required" /></td>
					<td align="center"> <input type="number" min=1 name="price" align="middle" required="required" /></td>
				</tr>
			</table>
			<br>
			<input type="submit" class="btn btn-outline btn-black" name="btn1" value="Insert Item" />
			<input type="reset" class="btn btn-outline btn-black" name="btn1" value="Clear" />
		</form>
		<br><br>
		<a href="/SpringFM/Homepage" class="btn btn-success" target="_parent">Display-Products</a>
		<a href="/SpringFM/AdminHome" class="btn btn-primary" target="_parent">Admin Home</a>

		<br><br><br><br>
		<h3>${msg }</h3>
	</div>

<script>
	$(document).ready(function(){
		if($("#type").val()!=''){
			$("#type").attr('disabled', 'disabled');
		}
	});
</script>

</center>
</body>
</html>
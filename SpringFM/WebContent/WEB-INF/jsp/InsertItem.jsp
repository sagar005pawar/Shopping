<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page errorPage="error.jsp" language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<jsp:include page="/links.jsp" />
<title>Insert Item</title>
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
	<form action="/SpringFM/ItemInserting" method="post" onsubmit="return confirm('Are you sure you want to Insert the item?');">
	<br><h2 style="font-family: Algerian">Product Inserting</h2><br><br><br>
	<table>
	<tr>
	    <th>Type/Section</th>
	    <th>Product Name</th>
		<th>Qty-Available</th>
		<th>Price</th>
	</tr>
	<tr>
	<c:if test="${type=='' || type==null}">
		<td align="center"> <input type="text" name="type" align="middle" required="required" /></td>
	</c:if>	
	<c:if test="${type!='' && type!=null}">
		<input type="hidden" name="type" value="${type }" required="required" /></td>
		<td align="center"> <input value="${type }" type="text" id="type" name="type" align="middle" required="required" /></td>
	</c:if>
		<td align="center"> <input type="text" name="prName" align="middle" required="required" /></td>
		<td align="center"> <input type="number" name="QA" align="middle" required="required" /></td>
		<td align="center"> <input type="number" min=1 name="price" align="middle" required="required" /></td>
		<td><input type="submit" class="btn btn-outline btn-black" name="btn1" value="Insert Item" align="middle" /></td>
		<td><input type="reset" class="btn btn-outline btn-black" name="btn1" value="Clear" align="middle" /></td>
	</tr>
</table>
</form>
	<br><br><br>
	<a href="/SpringFM/Homepage" class="btn btn-outline btn-success" target="_parent">Display-Products</a>
	<a href="/SpringFM/AdminHome" class="btn btn-outline btn-primary" target="_parent">Admin Home</a>

	<br><br><br><br>
	<h3>${msg }</h3>

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
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
	if(session.isNew() || (session.getAttribute("userLog")!="login")) {
		response.sendRedirect("/SpringFM/AdminLogout");
	} 
%>
<center>
	<form action="SingleController?page=ItemUpdating" method="post" onsubmit="return confirm('Are you sure you want to Upadate this item?');">
	<br><h2><u>Product Updating</u></h2><br><br>
	<table style=" text-align: center;">
	<tr>
		<th>Pr_ID</th>
	    <th>Product Name</th>
	    <th>Type/Section</th>
		<th>Qty-Available</th>
		<th>Price</th>
	</tr>
	<tr>
		<td align="center"> <input type="number" name="a1" align="middle" required="required" /></td>
		<td align="center"> <input type="text" name="a2" align="middle" required="required" /></td>
		<td align="center"> <input type="text" name="a3" align="middle" required="required" /></td>
		<td align="center"> <input type="number" name="a4" align="middle" required="required" /></td>
		<td align="center"> <input type="number" name="a5" min=1 align="middle" required="required" /></td>
		<td><input type="submit" class="btn btn-outline btn-black" name="btn1" value="Update Item" align="middle" /></td>
		<td><input type="reset" class="btn btn-outline btn-black" name="btn1" value="Clear" align="middle" /></td>
	</tr>	
	
</table>
</form>

	<br><br><br>
	<a href="/Spring/Homepage" class="btn btn-success" target="_parent">Display-Products</a>
	<a href="/SpringFM/AdminHome" class="btn btn-primary" target="_parent">Admin Home</a>

<!-- 	
	<input type="button" name="btn1" target="_parent" value="Display-Products" align="middle" onclick='window.location.href="Homepage.jsp"' />
	<input type="button" name="btn3" target="_parent" value="Admin Home" align="middle" onclick='window.location.href="AdminHomePage.jsp"'>
 -->
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
<%-- 
	<c:out value="${id }"></c:out>
	<c:out value="${prname }"></c:out>
	<c:out value="${type }"></c:out>
	<c:out value="${qta }"></c:out>
	<c:out value="${price }"></c:out>
 --%>
</body>
</html>
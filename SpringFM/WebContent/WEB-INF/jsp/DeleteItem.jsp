<%@ page errorPage="error.jsp" language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<jsp:include page="/links.jsp" />
<title>Delete Item</title>
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
	<br><h2 style="font-family: Algerian">Product Deleting</h2><br><br><br>

	<form action="/SpringFM/ItemDeletion" method="post">
	<table>
		<tr>
			<th>Product _ ID</th>
			<td align="center"> <input type="number" min=1 name="id" align="middle" required="required"/></td>
			<td><input type="submit" name="btn1" value="Delete Product" align="middle" /></td>
		</tr>
	</table>
	</form>
	
	<form action="/SpringFM/SectionDeletion" method="post">
	<table>
		<tr>
			<th>Section/Type</th>
			<td align="center"> <input type="text" name="type" align="middle" required="required" /></td>
			<td><input type="submit" name="btn2" value="Delete Section" align="middle" /></td>
		</tr>
	</table>
	</form>
	
	<br><br><br>
	<a href="/SpringFM/Homepage" class="btn btn-outline btn-success" target="_parent">Display-Products</a>
	<a href="/SpringFM/AdminHome" class="btn btn-outline btn-primary" target="_parent">Admin Home</a>

	<br><br><br><br><h3>${msg }</h3>

</center>
</body>
</html>
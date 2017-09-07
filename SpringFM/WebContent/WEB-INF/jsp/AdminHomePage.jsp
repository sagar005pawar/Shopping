<%@ page errorPage="error.jsp" language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Admin Home</title>
  <link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
  	<jsp:include page="/links.jsp" />
  <script type="text/javascript" src="js/modernizr.custom.js"></script>
  <script type="text/javascript" src="js/move-top.js"></script>
  <script type="text/javascript" src="js/easing.js"></script>		
</head>

<body class="container adminHomepage" >
<%
	//Back Button Cache Disable
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Expires", "0");				
	if(session.isNew() || (session.getAttribute("userLog")!="login")) {
		response.sendRedirect("/SpringFM/AdminLogout");
	} 

%>

	<br><br><br><div style=" font-size: 38px; text-align: center; color: white; font-family: Castellar;"><u>Admin-Home</u></div><br><br>
	<div class="adminhome" align="center">
		<div class="adminoperations" >
			<a class="ln" href="/SpringFM/insertItem">Insert Items</a><br><br>
			<a class="ln" href="/SpringFM/updateItem">Update Items</a><br><br>
			<a class="ln" href="/SpringFM/deleteItem">Delete Items</a><br><br>
			<a class="ln" href="/SpringFM/Homepage">Display Items</a><br><br><br><br>
		</div>
		<a class="ln out" href="/SpringFM/AdminLogout" target="_parent">Logout </a><br><br>
	</div>	
</body>
</html>
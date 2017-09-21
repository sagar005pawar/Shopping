<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page errorPage="error.jsp" language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Welcome</title>
	<jsp:include page="/links.jsp"></jsp:include>
</head>
<body class="welcome-body">
<%
	if(session.isNew() || (session.getAttribute("userLog")!="login")) {
		response.sendRedirect("/SpringFM/logout");
	} 
%>
<center>
	<br><br>
	<div class="welcome-heading">WELCOME</div><br><br>
    <div class="w-city">
        <h2>Your city is: ${user.city }</h2>
    </div>
	<br><br><br>
	<a class="u-home-link" href="UserHomepage">Continue To Shopping Centre</a>
	<h3>OR</h3>
	<a class="Logout" href="logout">Get-Back</a>
</center>
</body>
</html>
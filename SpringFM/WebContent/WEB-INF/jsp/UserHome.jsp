<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.util.*"%>
<%@page import="com.model.Products"%>
<%@ page errorPage="error.jsp" language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>HOME</title>
	<jsp:include page="/links.jsp" />
</head>
<body class="container homesec">
<%
	if(session.isNew() || (session.getAttribute("userLog")!="login")) {
		response.sendRedirect("/SpringFM/logout");
	} 
%>
<center>
	<h2 style="font-family: Stencil">Shop SECTIOS</h2><br />
	<div style="font-family: AR JULIAN;">You can choice any section here for it should take, What are the requirments of us...?</div>
	<a href="/SpringFM/UserProfile/${user.id }" target="frame3" >${user.fname } ${user.lname }</a>
	<br>
	
	<c:forEach var="s" items="${sc }" varStatus="status">
		<h3><a class="section slink" href="SectionItemsListToUser/${s }" target="frame3">${s }</a></h3>
	</c:forEach>

	<form action="/SpringFM/Pay" target="frame3">
		<h3><input class="btn btn-outline btn-info" type="submit" value="Show AMT"></h3><br>
	</form>

	<a class="hlink" href="logout" target="_parent">Logout </a><br><br>
	
	<a class="hlink" href="Wel.jsp" target="frame3">@About us</a>
</center>

</body>
</html>
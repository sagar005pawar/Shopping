<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.model.*"%>
<%@page import="java.util.*"%>
<%@ page errorPage="error.jsp" language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>HOME</title>
	<jsp:include page="/links.jsp" />
</head>
<body class="container homesec">
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
	<h2 style="font-family: Stencil">Shop SECTIOS</h2><br />
		<div style="font-family: AR JULIAN;">You can choice any section here for it should take, What are the requirments of us...?</div>
		<br>
		
		<c:forEach var="s" items="${sc }" varStatus="status">
			<h3><a class="section slink" href="SectionItemsList/${s }" target="frame3">${s }</a></h3>
		</c:forEach>
		
	<form action="/SpringFM/AdminHome" target="_parent" >
		<div class="adminHomeButton"><input class="btn btn-outline btn-info" type="submit" value="Admin Home"></div>
	</form>
	
	<a class="hlink" href="/SpringFM/AdminLogout" target="_parent">Logout </a><br><br>
	
	<a class="hlink" href="/SpringFM/Wel" target="frame3">@About us</a>

</center>
</body>
</html>
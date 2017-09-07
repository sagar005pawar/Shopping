<%@page import="com.dao.DAO" %>
<%@ page import="java.util.stream.*" %>
<%@ page import="com.model.Products" %>
<%@ page import="com.google.gson.Gson" language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	String term = request.getParameter("term");
System.out.println("term..= "+term);
	if (term!="" && term!=null) {
		try {
	        String searchList = new Gson().toJson((new DAO().getProducts()).stream().filter(p->p.getPrName().toLowerCase().contains(term.toLowerCase())).map(Products::getPrName).distinct().limit(4).collect(Collectors.toList()));
	        response.getWriter().write(searchList);
		} catch (Exception e) {
	        response.getWriter().write(" ");					
			System.out.println(e);
		}					
	} else {
	    response.getWriter().write(" ");					
	}
%>
</body>
</html>
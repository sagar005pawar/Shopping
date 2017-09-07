<%@ page errorPage="error.jsp" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<jsp:include page="/links.jsp" />
<title>HOMEPAGE</title>
</head>
<%
	//Back Button Cache Disable
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Expires", "0");				
	if(session.isNew() || (session.getAttribute("userLog")!="login")) {
		response.sendRedirect("/SpringFM/AdminLogout");
	} 

%>

<frameset rows="18%,79%,3%" border="0" class="container-fluid">
    <frame src="Heading.jsp">
    <frameset cols="20%,76%,4%">
        <frame src="/SpringFM/DisplayProductSections">
        <frame src="Wel.jsp" name="frame3">
           <frame src="border.jsp">
    </frameset>
        <frame src="border.jsp">
</frameset>
</html>
<%@ page errorPage="error.jsp" language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>HOMEPAGE</title>
	<jsp:include page="/links.jsp" />
</head>
<%
	if(session.isNew() || (session.getAttribute("userLog")!="login")) {
		response.sendRedirect("/SpringFM/logout");
	} 
%>
<frameset rows="18%,79%,3%" border="0" class="container-fluid">
    <frame src="UserHeading.jsp">
    <frameset cols="20%,76%,4%">
        <frame src="DisplayProductSectionsUserHome">
        <frame src="Wel.jsp" name="frame3">
           <frame src="border.jsp">
    </frameset>
        <frame src="border.jsp">
</frameset>


</html>
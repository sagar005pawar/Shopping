<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page errorPage="error.jsp" language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Heading</title>
  <link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
  <script type="text/javascript" src="js/modernizr.custom.js"></script>
  <script type="text/javascript" src="js/move-top.js"></script>
  <script type="text/javascript" src="js/easing.js"></script>
  	<jsp:include page="/links.jsp" />
</head>
<body class="container-fluid heading" ng-app="myApp" ng-controller="control">
<%
	if(session.isNew() || (session.getAttribute("userLog")!="login")) {
		response.sendRedirect("/SpringFM/logout");
	} 
%>
<center>
  	<div class="homeHeading">homepage
  		<input align="right" onkeyup="searchInfo()" ng-model="search" class="ajaxSearch" type='text' id="search" name="search" placeholder="Search"  />
 	</div>
 	  	<span class="searchingList" id="searchingList">
  		</span>
 	
  <marquee direction="left" scrollamount="10" width="100%" hieght="20px" >
  	This is shopping homepage & these are related sections following below:<br />
  </marquee>
  
</center>
<script type="text/javascript">
var request;
function searchInfo(){
 	if (window.XMLHttpRequest) {
    	// code for modern browsers
    	request = new XMLHttpRequest();
   	} else {
    	// code for IE6, IE5
    	request = new ActiveXObject("Microsoft.XMLHTTP");
    }
	var term = document.getElementById('search').value;
	var url = "/SpringFM/searchAJAX/" + term.trim();
	var string='';
	try {
		if((term.trim())==''||(term==null)){
			document.getElementById('searchingList').innerHTML = '';
		} else { 
			request.onreadystatechange=function(){
				if(request.readyState==4){
					var val = JSON.parse(request.responseText);
					for (var i=0; i < val.length; i++) {
						string += "<a class='aLinks' href='/SpringFM/searchAJAXpro/" + val[i] + "'" + "target='frame3'>" + val[i] + "</a>";
					}
					document.getElementById('searchingList').innerHTML = string;
				}else{
					document.getElementById('searchingList').innerHTML = '';
				}
			}//end of function
			request.open("GET",url,true);
			request.send();
		}
	}catch(e){
		alert("Unable to connect to server");
		document.getElementById('searchingList').innerHTML = '';
	}
}	
</script>

</body>
</html>
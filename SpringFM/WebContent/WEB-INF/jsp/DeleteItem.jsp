<%@ page errorPage="error.jsp" language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<jsp:include page="/links.jsp" />
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"  />
<title>Delete Item</title>
</head>
<body class="container">
<%
	if(session.isNew() || (session.getAttribute("userLog")!="login")) {
		response.sendRedirect("/SpringFM/AdminLogout");
	} 
%>
<center>
	<br><br><br>
	<div class="w3-card-4">
		<br><h2 style="font-family: Algerian">Product Deleting</h2><br><br>
		<div class="w3-grey"><br>
			<form action="/SpringFM/ItemDeletion" class="form-horizontal" method="post">
				<div class="form-group">
					<label for="id" class="col-sm-5 control-label">Product _ ID</label>			      
					<div class="col-sm-3">
						<input type="number" class="form-control" id="id" min=1 name="id" required="required" />
					</div>
					<div class="col-sm-1">
						<input class="btn btn-danger" type="submit" value="Delete Product" />
					</div>			  	
				</div>
			</form>
			<form action="/SpringFM/SectionDeletion" class="form-horizontal" method="post">
				<div class="form-group">
					<label for="id" class="col-sm-5 control-label">Section/Type</label>			      
					<div class="col-sm-3">
						<input type="text" class="form-control" id="type" name="type" required="required" />
					</div>
					<div class="col-sm-1">
						<input class="btn btn-danger" type="submit" value="Delete Section" />
					</div>			  	
				</div>
			</form>
			
			<br><br>
			<a href="/SpringFM/Homepage" class="btn btn-success" target="_parent">Display-Products</a>
			<a href="/SpringFM/AdminHome" class="btn btn-primary" target="_parent">Admin Home</a>
		
			<br><br><br><br><h3>${msg }</h3>		
		</div>
	</div>	
	

</center>
</body>
</html>
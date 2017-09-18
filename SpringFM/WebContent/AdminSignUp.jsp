<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ page errorPage="error.jsp" language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Admin-Sign-Up</title>
	<jsp:include page="/links.jsp" />
	<script type="text/javascript" src="js/validationSignUp.js"></script>	
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"  />
</head>

<body class="container regn-body">
<%
	if(!(session.isNew() || (session.getAttribute("userLog")!="login"))) {
		response.sendRedirect("/SpringFM/AdminLogout");
	} 
%>
<center>
<form class="form-horizontal w3-card-4 w3-light-blue" action="/SpringFM/ASignupCntl" name="loginForm" method="post" onsubmit='return(validation())'>
	<div class="productheading">ADMIN RegistratioN</div>
    <div class="form-group">
      <div class="col-sm-4 col-sm-offset-4">
      	<div class="input-group">
		    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
	        <input id="fname" pattern="[a-zA-Z][a-zA-Z0-9\s]*" name="fname" type="text" placeholder="Enter your First Name" title="Enter your First Name" class="form-control" required="required">
	        <span id="errfname"></span>
        </div>
      </div>
    </div>
    <div class="form-group">
      <div class="col-sm-4 col-sm-offset-4">
        <div class="input-group">
		    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
        	<input id="lname" pattern="[a-zA-Z][a-zA-Z0-9\s]*" name="lname" type="text" placeholder="Enter your SureName" title="Enter your LastName/SureName" class="form-control" required="required">
	        <span id="errlname"></span>
        </div>
      </div>
    </div>
    <div class="form-group">
      <div class="col-sm-4 col-sm-offset-4">
        <div class="input-group">
		    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
	        <input id="username" pattern="[a-zA-Z][a-zA-Z0-9\s]*" name="username" type="text" placeholder="Enter your UserName" title="Enter your UserName" class="form-control" required="required">
	        <span id="erruname"></span>
        </div>
      </div>
    </div>
    <div class="form-group">
      <div class="col-sm-4 col-sm-offset-4">
        <div class="input-group">
		    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
	        <input id="password" pattern="[a-zA-Z][a-zA-Z0-9\s]*" name="password" type="password" placeholder="Enter Password" title="Enter Password" class="form-control" required="required">
	        <span id="errpass"></span>
        </div>
      </div>
    </div>
    <div class="form-group">
      <div class="col-sm-4 col-sm-offset-4">
        <div class="input-group">
		    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
	        <input id="repassword" pattern="[a-zA-Z][a-zA-Z0-9\s]*" name="repassword" type="password" placeholder="Re-Enter Password" title="Re-Enter Password" class="form-control" required="required">
	        <span id="errpass"></span>
        </div>
      </div>
    </div>
    <div class="form-group ">
      <div class="col-sm-4 col-sm-offset-4">
      	<div class="input-group">
		    <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
	        <input id="email" name="email" type="email" placeholder="Enter your Email ID" title="Enter your Email ID" class="form-control" required="required">
	        <span id="erremail"></span>
        </div>
      </div>
    </div>
    <div class="form-group">
      <div class="col-sm-4 col-sm-offset-4">
        <div class="input-group">
		    <span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></span>
	        <input id="contact" name="contact" type="text" placeholder="Enter Mobile/Contact Number" title="Enter Mobile/Contact Number" pattern="[789][0-9]{9}" class="form-control" required="required">
	        <span id="errcon"></span>
        </div>
      </div>
    </div>
    <div class="form-group">
      <div class="col-sm-4 col-sm-offset-4">
        <div class="input-group">
		    <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
	        <input id="city" pattern="[a-zA-Z][a-zA-Z0-9\s]*" name="city" type="text" placeholder="Enter your City" title="Enter your City" class="form-control" required="required">
	        <span id="errcity"></span>
        </div>
      </div>
    </div>
    <div class="form-group">
      <div class="col-sm-4 col-sm-offset-4">
        <div class="input-group">
		    <span class="input-group-addon"><i class="glyphicon glyphicon-map-marker"></i></span>
	        <input id="pincode" name="pincode" type="text" pattern="[0-9]{6}" placeholder="Enter City Pin/Zip Code" title="Enter City Pin/Zip Code" class="form-control" required="required">
	        <span id="errpin"></span>
        </div>
      </div>
    </div>
	<input type="hidden" pattern="[a-zA-Z][a-zA-Z0-9\s]*" id="user" name="user" value="cust" required="required" />
	<div class="form-group">
    	<div class="col-sm-offset-2 col-sm-8">
      		<span class="text-danger" id="errorMessage"></span>
      	</div>
   	</div>
	<input class="btn btn-outline btn-success" type="submit"  value="Register" name="txt5">
    <input class="btn btn-outline btn-warning" type="reset" value="Reset">
    <a class="btn btn-outline btn-primary" href="/SpringFM/Admin">Login</a>
    <br><br>
</form>
</center>
</body>
</html>


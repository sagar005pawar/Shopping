<%@ page errorPage="error.jsp" language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sign-Up</title>
	<jsp:include page="/links.jsp" />
	<script type="text/javascript" src="js/validationSignUp.js"></script>	
	
</head>

<body class="container regn-body">
<%
	//Back Button Cache Disable
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Expires", "0");				
%>

<center>
<br /><br>
<h1>Registration form.....</h1>

<form action="/SpringFM/SignupCntl" name="loginForm" method="post" onsubmit='return(validation())'>

	<div class="regn-reqms">		
		<label id="uname">FirstName :</label>
		<input class="input-uname" title="Enter First-Name" type="text" id="txt1" name="fname" required="required" /><br />
		<label id="uname">LastName :</label>
		<input class="input-uname" title="Enter Last-Name" type="text" id="txt2" name="lname" required="required" /><br />
		<label id="uname">UserName :</label>
		<input class="input-uname" title="Enter the UserName" type="text" id="txt3" name="username" required="required" /><br />
		<label id="pass">Password :</label> 
		<input class="regn-input-pass" title="Enter the Password" type="password" id="txt4" name="password" required="required" /><br />
		<label id="uname">Email :</label>
		<input class="input-uname" type="email" id="txt5" name="email" title="Contact's email (format: xxx@xxx.xxx)" required="required" /><br />
		<label id="uname">Mobile :</label>
		<input class="input-uname" title="Enter Mobile/Contact Number" pattern="[789][0-9]{9}" type="text" id="txt6" name="contact" required="required" /><br />
		<label id="uname">Pincode :</label>
		<input class="input-uname" title="Enter City Pin/ZIP Code" pattern="[0-9]{6}" type="text" id="txt7" name="pincode" required="required" /><br />
		<label id="city">City :</label>
		<input class="input-city" title="Enter your City" type="text" name="city" id="txt8" required="required" />
		<input type="hidden" id="txt9" name="user" value="cust" required="required" />
	</div>
		
		
		
			<div class="form-group">
           		<div class="col-sm-offset-2 col-sm-8">
                	<span class="text-danger" id="errorMessage"></span>
            	</div>
            </div>
	
<br />
	<input type="submit"  value="Register" name="txt5">
    <input type="reset" value="Reset">
</form>

<form action="/SpringFM/" >
    <br><input type="submit" value="Cancel">
</form>
    </center>

</body>
</html>
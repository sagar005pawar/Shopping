<%@ page errorPage="error.jsp" language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sign-Up</title>
	<jsp:include page="/links.jsp" />
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"  />
</head>

<body class="container regn-body">
<%
	//Back Button Cache Disable
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Expires", "0");				
%>

<center>
<br>

<form class="form-horizontal w3-card-4 w3-grey" action="/SpringFM/SignupCntl" name="loginForm" method="post" onsubmit='return(validation())'>
	<label style="font-size: 25px;">Registration form.....</label>
    <div class="form-group">
      <div class="col-sm-4 col-sm-offset-4">
      	<div class="input-group">
		    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
	        <input id="fname" name="fname" type="text" placeholder="Enter your First Name" title="Enter your First Name" class="form-control" required="required">
	        <span id="errfname"></span>
        </div>
      </div>
    </div>
    <div class="form-group">
      <div class="col-sm-4 col-sm-offset-4">
        <div class="input-group">
		    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
        	<input id="lname" name="lname" type="text" placeholder="Enter your SureName" title="Enter your LastName/SureName" class="form-control" required="required">
	        <span id="errlname"></span>
        </div>
      </div>
    </div>
    <div class="form-group">
      <div class="col-sm-4 col-sm-offset-4">
        <div class="input-group">
		    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
	        <input id="username" name="username" type="text" placeholder="Enter your UserName" title="Enter your UserName" class="form-control" required="required">
	        <span id="erruname"></span>
        </div>
      </div>
    </div>
    <div class="form-group">
      <div class="col-sm-4 col-sm-offset-4">
        <div class="input-group">
		    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
	        <input id="password" name="password" type="password" placeholder="Enter Password" title="Enter Password" class="form-control" required="required">
	        <span id="errpass"></span>
        </div>
      </div>
    </div>
    <div class="form-group">
      <div class="col-sm-4 col-sm-offset-4">
        <div class="input-group">
		    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
	        <input id="repassword" name="repassword" type="password" placeholder="Re-Enter Password" title="Re-Enter Password" class="form-control" required="required">
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
	        <input id="city" name="city" type="text" placeholder="Enter your City" title="Enter your City" class="form-control" required="required">
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
	<input type="hidden" id="user" name="user" value="cust" required="required" />
	<div class="form-group">
    	<div class="col-sm-offset-2 col-sm-8">
      		<span class="text-danger" id="errorMessage"></span>
      	</div>
   	</div>
	<input class="btn btn-outline btn-success" type="submit"  value="Register" name="txt5">
    <input class="btn btn-outline btn-warning" type="reset" value="Reset">
    <a class="btn btn-outline btn-primary" href="/SpringFM/">Cancel</a>
    <br><br>
</form>
</center>

<script type="text/javascript">
function validation() {
	var f=document.loginForm.fname.value;
	var l=document.loginForm.lname.value;
	var u=document.loginForm.username.value;
	var p=document.loginForm.password.value;
	var rp=document.loginForm.repassword.value;
	var e=document.loginForm.email.value;
	var m=document.loginForm.contact.value;
	var c=document.loginForm.city.value;
	var pc=document.loginForm.pincode.value;
	var fsj=f.split(' ').join('+');
	var lsj=l.split(' ').join('+');
	var usj=u.split(' ').join('+');
	var psj=p.split(' ').join('+');
	var rpsj=rp.split(' ').join('+');
	var esj=e.split(' ').join('+');
	var msj=m.split(' ').join('+');
	var csj=c.split(' ').join('+');
	var pcsj=pc.split(' ').join('+');
	
	var atpos=e.indexOf("@");
	var dotpos=e.lastIndexOf(".");
	
//	document.getElementById("errorMessage").innerHTML="Sign-Up Field should not be blank..";
	if(f=="" || fsj!=f){
		window.alert("FirstName Field should not be blank or Spaces..");
		document.loginForm.fname.focus();
		document.getElementById("errfname").innerHTML='<span class="glyphicon glyphicon-remove form-control-feedback"></span>';
		document.getElementById("errorMessage").innerHTML="FirstName Field should not be blank or Spaces..";
		return false;
	}
	if(l=="" || lsj!=l){
		window.alert("LastName Field should not be blank or Spaces..");
		document.loginForm.lname.focus();
		document.getElementById("errlname").innerHTML='<span class="glyphicon glyphicon-remove form-control-feedback"></span>';
		document.getElementById("errorMessage").innerHTML="LastName Field should not be blank or Spaces..";
		return false;
	}
	if(u=="" || usj!=u){
		window.alert("Username Field should not be blank or Spaces..");
		document.loginForm.username.focus();
		document.getElementById("erruname").innerHTML='<span class="glyphicon glyphicon-remove form-control-feedback"></span>';
		document.getElementById("errorMessage").innerHTML="Username Field should not be blank or Spaces..";
		return false;
	}
	if(p=="" || psj!=p || rp=="" || rpsj!=rp) {
		window.alert("Password Field should not be blank or Spaces..");
		document.getElementById("errpass").innerHTML='<span class="glyphicon glyphicon-remove form-control-feedback"></span>';
		document.loginForm.password.focus();
		document.getElementById("errorMessage").innerHTML="Password Field should not be blank or Spaces..";
		return false;
	} else {
		if(psj.length<2){
			window.alert("Password Size atleast 2..");
			document.getElementById("errpass").innerHTML='<span class="glyphicon glyphicon-remove form-control-feedback"></span>';
			document.loginForm.password.focus();
			document.getElementById("errorMessage").innerHTML="Password Size atleast 2..";
			return false;
		} else {
			if((psj!=rpsj)||(p!=rp)){
				window.alert("Password & Re-enter Password Both are not matched..!");
				document.getElementById("errpass").innerHTML='<span class="glyphicon glyphicon-remove form-control-feedback"></span>';
				document.loginForm.password.focus();
				document.getElementById("errorMessage").innerHTML="Password & Re-enter Password Both are not matched..!";
				return false;
			} else {
				document.getElementById("errpass").innerHTML='<span class="glyphicon glyphicon-ok form-control-feedback"></span>';
				return true;
			}
		}
	}
	if((e=="") || (esj!=e)){
		window.alert("Email Field should not be blank or Spaces..");
		document.getElementById("erremail").innerHTML='<span class="glyphicon glyphicon-remove form-control-feedback"></span>';
		document.loginForm.email.focus();
		document.getElementById("errorMessage").innerHTML="Email Field should not be blank or Spaces..";
		return false;
	} else {
		if((atpos<1) || (dotpos<atpos+2) || (dotpos+2>=e.length)){
			document.loginForm.email.focus();
			window.alert("Please enter Valid Email-Id..");				
			document.getElementById("erremail").innerHTML='<span class="glyphicon glyphicon-remove form-control-feedback"></span>';
			document.getElementById("errorMessage").innerHTML="Please enter Valid Email-Id..";
			return false;
		}
	}
	if(m=="" || msj!=m){
		window.alert("Contact/Mobile Field should not be blank or Spaces..");
		document.getElementById("errcon").innerHTML='<span class="glyphicon glyphicon-remove form-control-feedback"></span>';
		document.loginForm.contact.focus();
		document.getElementById("errorMessage").innerHTML="Contact/Mobile Field should not be blank or Spaces..";
		return false;
	}
	if(c=="" || csj!=c){
		window.alert("City Field should not be blank or Spaces..");
		document.getElementById("errcity").innerHTML='<span class="glyphicon glyphicon-remove form-control-feedback"></span>';
		document.loginForm.city.focus();
		document.getElementById("errorMessage").innerHTML="City Field should not be blank or Spaces..";
		return false;
	}
	if(pc=="" || pcsj!=pc){
		window.alert("Pincode Field should not be blank or Spaces..");
		document.getElementById("errpin").innerHTML='<span class="glyphicon glyphicon-remove form-control-feedback"></span>';
		document.loginForm.pincode.focus();
		document.getElementById("errorMessage").innerHTML="Pincode Field should not be blank or Spaces..";
		return false;
	}
//	return true;
}
</script>

</body>
</html>
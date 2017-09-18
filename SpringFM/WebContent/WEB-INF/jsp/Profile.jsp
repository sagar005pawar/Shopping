<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Profile</title>
	<jsp:include page="/links.jsp" />
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"  />
</head>
<body>
<%
	if(session.isNew() || (session.getAttribute("userLog")!="login")) {
		response.sendRedirect("/SpringFM/AdminLogout");
	} 
%>
	<div class="container text-center">
		<div class="productheading">PROFILE</div>
		<a href="/SpringFM/Homepage" class="btn btn-success" target="_parent">Display-Products</a> 
		<a href="/SpringFM/AdminHome" class="btn btn-primary" target="_parent">Admin Home</a>
		<input onclick="window.location.href='/SpringFM/AdminLogout'" type="button" class="btn btn-warning" value="Logout" />
		<br><br>
		<form action="/SpringFM/AdSaveChanges" class="form-horizontal w3-card-4" name="loginForm" method="post" onsubmit='return(validationPro())'>
			<div class="w3-grey">
			    <div class="form-group">
					<label for="id" class="col-sm-5 control-label">ID</label>			      
					<div class="col-sm-3">
						<label id="id" class="col-sm-1 control-label">${urPro.id }</label>
						<input type="hidden" id="id" name="id" value="${urPro.id }" required="required" />
						<span id="errid"></span>
				  	</div>
			    </div>		
			    <div class="form-group">
					<label for="fname" class="col-sm-5 control-label">First Name</label>			      
					<div class="col-sm-3">
				        <input value="${urPro.fname }" pattern="[a-zA-Z][a-zA-Z0-9\s]*" id="fname" name="fname" type="text" placeholder="Enter your First Name" title="Enter your First Name" class="form-control" required="required">
						<span id="errfname"></span>
				  	</div>
			    </div>
			    <div class="form-group">
					<label for="lname" class="col-sm-5 control-label">Last Name</label>			      
					<div class="col-sm-3">
			        	<input value="${urPro.lname }" pattern="[a-zA-Z][a-zA-Z0-9\s]*" id="lname" name="lname" type="text" placeholder="Enter your SureName" title="Enter your LastName/SureName" class="form-control" required="required">
						<span id="errlname"></span>
				  	</div>
			    </div>
			    <div class="form-group">
					<label for="email" class="col-sm-5 control-label">Email</label>			      
					<div class="col-sm-3">
				        <input value="${urPro.email }" id="email" name="email" type="email" placeholder="Enter your Email ID" title="Enter your Email ID" class="form-control" required="required">
						<span id="erremail"></span>
				  	</div>
			    </div>
			    <div class="form-group">
					<label for="contact" class="col-sm-5 control-label">Contact</label>			      
					<div class="col-sm-3">
				        <input value="${urPro.contact }" id="contact" name="contact" type="text" placeholder="Enter Mobile/Contact Number" title="Enter Mobile/Contact Number" pattern="[789][0-9]{9}" class="form-control" required="required">
						<span id="errcon"></span>
				  	</div>
			    </div>
			    <div class="form-group">
					<label for="city" class="col-sm-5 control-label">City</label>			      
					<div class="col-sm-3">
				        <input value="${urPro.city }" pattern="[a-zA-Z][a-zA-Z0-9\s]*" id="city" name="city" type="text" placeholder="Enter your City" title="Enter your City" class="form-control" required="required">
						<span id="errcity"></span>
				  	</div>
			    </div>
			    <div class="form-group">
					<label for="pincode" class="col-sm-5 control-label">Pincode</label>			      
					<div class="col-sm-3">
				        <input value="${urPro.pincode }" id="pincode" name="pincode" type="text" pattern="[0-9]{6}" placeholder="Enter City Pin/Zip Code" title="Enter City Pin/Zip Code" class="form-control" required="required">
						<span id="errpin"></span>
				  	</div>
			    </div>
			    <div class="form-group">
					<label for="fname" class="col-sm-5 control-label">FromBy</label>			      
					<div class="col-sm-3">
						<a href="/SpringFM/profile/${urPro.fromBy }">
						<label id="fname" class="col-sm-1 control-label">${urPro.id }</label>
						</a>
						<span id="errfname"></span>
				  	</div>
			    </div>
			</div>
 	    	<input class="btn btn-outline btn-black"  type="submit" value="Save Changes" />
 	    	<input class="btn btn-outline btn-black"  type="reset" value="Reset" />
 	    	<input onclick="window.scrollBy(0, 350)" class="btn btn-outline btn-black"  type="button" value="Change Password" />
 	    	<input onclick="history.back()" class="btn btn-outline btn-black"  type="button" value=" BACK " />
 	    	<br><br><span id="errorMessage" style="color: red; font-weight: bold;">${msg }</span>
 	    	<br>
		</form>

 	    <br><br><br><br><br>

		<form action="/SpringFM/AdChangePassword" class="w3-card-4" name="changeForm" method="post" onsubmit='return(validationPass())'>
		<table class="w3-table w3-responsive w3-grey">
			<tbody>
				<tr>
					<th>Current Password</th>
					<td>
						<input type="hidden" id="txt4" name="chPassword" value="${urPro.password }" required="required" />
						<input type="hidden" id="id" name="id" value="${urPro.id }" required="required" />
						<input type="password" pattern="[a-zA-Z][a-zA-Z0-9\s]*" id="txt4" name="cnPassword" required="required" />
					</td>
				</tr>
				<tr>
					<th>NEW Password</th>
					<td>
						<input type="password" pattern="[a-zA-Z][a-zA-Z0-9\s]*" id="txt4" name="nPassword" required="required" />
					</td>
				</tr>
				<tr>
					<th>Confirm </th>
					<td>
						<input type="password" pattern="[a-zA-Z][a-zA-Z0-9\s]*" id="txt4" name="password" required="required" />
					</td>
				</tr>				
			</tbody>
		</table>
 	    	<br>
 	    	<input class="btn btn-outline btn-black"  type="submit" value="Change Password" />
 	    	<input class="btn btn-outline btn-black"  type="reset" value="Reset" /> 	    	
 	    	<input onclick="window.scrollBy(0, -350)" class="btn btn-outline btn-black"  type="button" value="PROFILE" /> 	    	
 	    	<input onclick="history.back()" class="btn btn-outline btn-black"  type="button" value=" BACK " />
 	    	<br><br>
 	    	<span id="passerr" style="color: red; font-weight: bold;"></span>
 	    	<span id="msg" style="color: red; font-weight: bold;">${msg }</span>
 	    	<br>
 	    </form>
 	    <br><br>
	</div>
<script type="text/javascript">
function validationPro() {
	var f=document.loginForm.fname.value;
	var l=document.loginForm.lname.value;
	var e=document.loginForm.email.value;
	var m=document.loginForm.contact.value;
	var c=document.loginForm.city.value;
	var pc=document.loginForm.pincode.value;
	var fsj=f.split(' ').join('+');
	var lsj=l.split(' ').join('+');
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



function validationPass() {
	var pass = document.changeForm.chPassword.value;
	var cnpass = document.changeForm.cnPassword.value;
	var nwpass = document.changeForm.nPassword.value;
	var cmpass = document.changeForm.password.value;
	var pasj = pass.split(' ').join('+');
	var cnsj = cnpass.split(' ').join('+');
	var nwsj = nwpass.split(' ').join('+');
	var cmsj = cmpass.split(' ').join('+');

	if(pass=="" || pasj!=pass || cnpass=="" || cnsj!=cnpass || nwpass=="" || nwsj!=nwpass || cmpass=="" || cmsj!=cmpass) {
		document.getElementById("passerr").innerText = "Password Field should not be blank or Spaces..!";
		return false;
	} else {
		if(nwsj.length<2){
			document.getElementById("passerr").innerText = "Password Size atleast 2..";
			return false;			
		} else {
			if(pass!=cnpass){
				document.getElementById("passerr").innerText = "Current password didn't Matched!";
				return false;
			}
			
			if(nwpass!=cmpass){
				document.getElementById("passerr").innerText = "NEW & Confirm password's Not Matched!";
				return false;
			}

			if(nwpass==cmpass){
				if(pass==nwpass){
					document.getElementById("passerr").innerText = "We need to enter the new Password..!";
					return false;			
				}
			}		
			
		}
	}
}
</script>	
</body>
</html>


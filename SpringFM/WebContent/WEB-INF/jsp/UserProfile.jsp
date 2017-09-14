<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Profile</title>
	<jsp:include page="/links.jsp" />
	<script type="text/javascript" src="js/validationSignUp.js"></script>	
	<link rel="stylesheet" href='<c:url value="https://www.w3schools.com/w3css/4/w3.css"></c:url>'  />
</head>
<body>
	<div class="container text-center">
		<div class="productheading">PROFILE</div>
		<form action="/SpringFM/SaveChanges" class="w3-card-4" name="loginForm" method="post" onsubmit='return(validation())'>
		<table class="w3-table w3-responsive w3-grey">
			<tbody>
				<tr>
					<th>ID</th>
					<td>${urPro.id }
						<input type="hidden" id="id" name="id" value="${urPro.id }" required="required" />
					</td>
				</tr>
				<tr>
					<th>First Name</th>
					<td><input type="text" id="txt1" name="fname" value="${urPro.fname }" required="required"  /></td>
				</tr>
				<tr>
					<th>Last Name</th>
					<td><input type="text" id="txt2" name="lname" value="${urPro.lname }" required="required"  /></td>
				</tr>
				<tr>
					<th>Email</th>
					<td><input type="email" id="txt5" name="email" title="Contact's email (format: xxx@xxx.xxx)" required="required" value="${urPro.email }"  /></td>
				</tr>
				<tr>
					<th>Contact</th>
					<td><input title="Enter Mobile/Contact Number" pattern="[789][0-9]{9}" type="text" id="txt6" name="contact" value="${urPro.contact }" required="required"  /></td>
				</tr>
				<tr>
					<th>City</th>
					<td><input title="Enter your City" type="text" name="city" id="txt8" value="${urPro.city }" required="required"  /></td>
				</tr>
				<tr>
					<th>Pincode</th>
					<td><input title="Enter City Pin/ZIP Code" pattern="[0-9]{6}" type="text" id="txt7" name="pincode" value="${urPro.pincode }" required="required"  /></td>
				</tr>
			</tbody>
		</table>
 	    	<br>
 	    	<input class="btn btn-outline btn-black"  type="submit" value="Save Changes" />
 	    	<input onclick="window.scrollBy(0, 300)" class="btn btn-outline btn-black"  type="button" value="Change Password" />
 	    	<input onclick="history.back()" class="btn btn-outline btn-black"  type="button" value=" BACK " />
 	    	<span style="color: red; font-weight: bold;">${msg }</span>
 	    	<br><br>
 	    </form> 

 	    <hr>

		<form action="/SpringFM/ChangePassword" class="w3-card-4" name="changeForm" method="post" onsubmit='return(validationPass())'>
		<table class="w3-table w3-responsive w3-grey">
			<tbody>
				<tr>
					<th>Current Password</th>
					<td>
						<input type="hidden" id="txt4" name="chPassword" value="${urPro.password }" required="required" />
						<input type="hidden" id="id" name="id" value="${urPro.id }" required="required" />
						<input type="password" id="txt4" name="cnPassword" required="required" />
					</td>
				</tr>
				<tr>
					<th>NEW Password</th>
					<td>
						<input type="password" id="txt4" name="nPassword" required="required" />
					</td>
				</tr>
				<tr>
					<th>Confirm </th>
					<td>
						<input type="password" id="txt4" name="password" required="required" />
					</td>
				</tr>				
			</tbody>
		</table>
 	    	<br>
 	    	<input class="btn btn-outline btn-black"  type="submit" value="Change Password" />
 	    	<input onclick="window.scrollBy(0, -300)" class="btn btn-outline btn-black"  type="button" value="PROFILE" /> 	    	
 	    	<input onclick="history.back()" class="btn btn-outline btn-black"  type="button" value=" BACK " />
 	    	<br><br>
 	    	<span id="passerr" style="color: red; font-weight: bold;"></span>
 	    	<span id="msg" style="color: red; font-weight: bold;">${msg }</span>
 	    	<br><br>
 	    </form>
 	    <br><br>
	</div>
<script type="text/javascript">
function validationPass() {
	var pass = document.changeForm.chPassword.value;
	var cnpass = document.changeForm.cnPassword.value;
	var nwpass = document.changeForm.nPassword.value;
	var cmpass = document.changeForm.password.value;
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
</script>

</body>
</html>


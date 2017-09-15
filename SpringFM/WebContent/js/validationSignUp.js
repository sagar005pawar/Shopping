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





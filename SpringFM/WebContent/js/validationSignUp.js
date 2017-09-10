	function validation() {
//		document.getElementById("errorMessage").innerHTML="Sign-Up Field should not be blank..";
		if(document.loginForm.txt1.value=="" || document.loginForm.txt1.value.split(' ').join('+')!=document.loginForm.txt1.value){
			document.getElementById("errorMessage").innerHTML="FirstName Field should not be blank or Spaces..";
			window.alert("FirstName Field should not be blank or Spaces..");
			document.loginForm.txt1.focus();
			return false;
		}
		if(document.loginForm.txt2.value=="" || document.loginForm.txt2.value.split(' ').join('+')!=document.loginForm.txt2.value){
			document.getElementById("errorMessage").innerHTML="LastName Field should not be blank or Spaces..";
			window.alert("LastName Field should not be blank or Spaces..");
			document.loginForm.txt2.focus();
			return false;
		}
		if(document.loginForm.txt3.value=="" || document.loginForm.txt3.value.split(' ').join('+')!=document.loginForm.txt3.value){
			window.alert("Username Field should not be blank or Spaces..");
			document.getElementById("errorMessage").innerHTML="Username Field should not be blank or Spaces..";
			document.loginForm.txt3.focus();
			return false;
		}
		if(document.loginForm.txt4.value=="" || document.loginForm.txt4.value.split(' ').join('+')!=document.loginForm.txt4.value){
			window.alert("Password Field should not be blank or Spaces..");
			document.getElementById("errorMessage").innerHTML="Password Field should not be blank or Spaces..";
			document.loginForm.txt4.focus();
			return false;
		}
		if(document.loginForm.txt5.value=="" || document.loginForm.txt5.value.split(' ').join('+')!=document.loginForm.txt5.value){
			window.alert("Email Field should not be blank or Spaces..");
			document.getElementById("errorMessage").innerHTML="Email Field should not be blank or Spaces..";
			document.loginForm.txt5.focus();
			return false;
		}
		if(document.loginForm.txt6.value=="" || document.loginForm.txt6.value.split(' ').join('+')!=document.loginForm.txt6.value){
			window.alert("Contact/Mobile Field should not be blank or Spaces..");
			document.getElementById("errorMessage").innerHTML="Contact/Mobile Field should not be blank or Spaces..";
			document.loginForm.txt6.focus();
			return false;
		}
		if(document.loginForm.txt7.value=="" || document.loginForm.txt7.value.split(' ').join('+')!=document.loginForm.txt7.value){
			window.alert("Pincode Field should not be blank or Spaces..");
			document.getElementById("errorMessage").innerHTML="Pincode Field should not be blank or Spaces..";
			document.loginForm.txt7.focus();
			return false;
		}
		if(document.loginForm.txt8.value=="" || document.loginForm.txt8.value.split(' ').join('+')!=document.loginForm.txt8.value){
			window.alert("city Field should not be blank or Spaces..");
			document.getElementById("errorMessage").innerHTML="city Field should not be blank or Spaces..";
			document.loginForm.txt8.focus();
			return false;
		}
		return true;
	}

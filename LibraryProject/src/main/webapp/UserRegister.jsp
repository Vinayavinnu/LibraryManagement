<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Registration</title>
<style>
body {
  font-family: Arial, Helvetica, sans-serif;
}

* {
  box-sizing: border-box;
}

/* Add padding to containers */
.container {
  padding: 10px;
  background-color: white;
  margin-left:400px;
}

/* Full-width input fields */
input[type=text], input[type=password] {
  width: 100%;
  padding: 10px;
  margin: 0 0 18px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}

input[type=text]:focus, input[type=password]:focus {
  background-color: #ddd;
  outline: none;
}

/* Overwrite default styles of hr */
hr {
  border: 1px solid #f1f1f1;
  margin-bottom: 25px;
   margin-right:470px;
}

/* Set a style for the submit button */
.registerbtn {
  background-color: #000080;
  color: white;
  padding: 16px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}

.registerbtn:hover {
  opacity: 1;
}

/* Add a blue text color to links */
a {
  color: dodgerblue;
}

/* Set a grey background color and center the text of the "sign in" section */
.signin {
  background-color: #f1f1f1;
  text-align: center;
}
</style>
<script type="text/javascript">
	function validate(){
		var userName = document.getElementById("userName").value;
		var password = document.getElementById("password").value;
		var confirmPassword = document.getElementById("confirmPassword").value;
		var email = document.getElementById("email").value;
		var phone = document.getElementById("phone").value;
		
		var validationError=false;
		var nameRegex=/^[a-zA-Z]+$/;
		var emailRegex=/^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
		var phoneRegex=/^\d{10}$/;
		
		if (userName=="")
			{
				document.getElementById("nameError").innerHTML="Please enter name...";
				document.getElementById("userName").focus();
				validationError=true;
			}	

		else if(nameRegex.test(userName))
			{
				document.getElementById("nameError").innerHTML="";	
				
			}
		
		else
		{
			document.getElementById("nameError").innerHTML="Enter valid name...";
			document.getElementById("userName").focus();
			validationError=true;
		}
		if(userName.length<3||userName.length>10)
		{
			document.getElementById("nameError").innerHTML="Username length should be between 3 to 10...";
			document.getElementById("userName").focus();
			validationError=true;
		}
		
		if (password=="")
			{
				document.getElementById("passwordError").innerHTML="Please enter password...";
				document.getElementById("password").focus();
				validationError=true;
			}
		else if(password.length<8 || password.length>16)
		{
			document.getElementById("passwordError").innerHTML="Password length should be between 8 to 16...";
			document.getElementById("password").focus();
			validationError=true;
		}

		else
		{
			document.getElementById("passwordError").innerHTML="";	
		}
		
		if (confirmPassword=="")
		{
			document.getElementById("confirmPasswordError").innerHTML="Please enter confirm password...";
			document.getElementById("confirmPassword").focus();
			validationError=true;
		}
		else if(password!=confirmPassword)
		{
			document.getElementById("confirmPasswordError").innerHTML="Please enter same password...";
			document.getElementById("confirmPassword").focus();
			validationError=true;
		}
		else
		{
			document.getElementById("confirmPasswordError").innerHTML="";	
		}
		
		if (email=="")
		{
			document.getElementById("emailError").innerHTML="Please enter email...";
			document.getElementById("email").focus();
			validationError=true;
		}
		else if(emailRegex.test(email))
		{
			document.getElementById("emailError").innerHTML="";			
		}
		else
		{
			document.getElementById("emailError").innerHTML="Please enter valid email...";
			document.getElementById("email").focus();
			validationError=true;
		}
		
		if (phone=="")
		{
			document.getElementById("phoneError").innerHTML="Please enter phone number...";
			document.getElementById("phone").focus();
			validationError=true;
		}
		else if(phoneRegex.test(phone))
		{
			document.getElementById("phoneError").innerHTML="";			
		}
		else
		{
			document.getElementById("phoneError").innerHTML="Please enter valid phone number...";
			document.getElementById("phone").focus();
			validationError=true;
		}
		
		if(validationError)
			return false;
		return true;
		
	}
</script>
</head>
<body>
	<form name="registrationForm" onsubmit="return validate();" action="UserRegister" method="post">
	<div class="container">
	 <h1>Register Form</h1>
	 <p>Please enter credentials.</p>
	 <hr>
		<table>
			<tr>
				<td><label for="userName"><b>User Name</b></label></td>
				<td><input type="text" placeholder="User Name" name="userName" id="userName"></td>
				<td><span style="color:red" id="nameError">*</span></td>
			</tr>
			<tr>
				<td><label for="password"><b>Password</b></label></td>
				<td><input type="password" placeholder="Password" name="password" id="password"></td>
				<td><span style="color:red" id="passwordError">*</span></td>
			</tr>
			<tr>
				<td><label for="confirmpassword"><b>Confirm Password</b></label></td>
				<td><input type="password" placeholder="Confirm Password" name="confirmPassword" id="confirmPassword"></td>
				<td><span style="color:red" id="confirmPasswordError">*</span></td>
			</tr>
			<tr>
				<td><label for="email"><b>Email</b></label></td>
				<td><input type="text" placeholder="Email" name="email" id="email"></td>
				<td><span style="color:red" id="emailError">*</span></td>
			</tr>
			<tr>
				<td><label for="phone"><b>Phone</b></label></td>
				<td><input type="text" placeholder="Phone" name="phone" id="phone"></td>
				<td><span style="color:red" id="phoneError">*</span></td>
			</tr>
			<tr>				
				<td colspan="2"><input class="registerbtn" type="submit" value="Register"></td>		
			</tr>
			<tr>
				<td>Already User ? <a href="Login.jsp">Login</a></td>
			</tr>
		</table>
			  </div>
	</form>
</body>
</html>
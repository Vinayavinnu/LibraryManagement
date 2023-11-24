<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
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
   margin-left: 400px;
}

/* Full-width input fields */
input[type=text], input[type=password] {
  width: 100%;
  padding: 10px;
  margin: 0px 0px 18px 0px;
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
  margin-bottom: 20px;
   margin-right:350px;
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
  margin-top:20px;
}

/* Set a grey background color and center the text of the "sign in" section */
.signin {
  background-color: #f1f1f1;
  text-align: center;
}

</style>
</head>
<body>
	<%
		if(request.getAttribute("Message")!=null){
			String msg=request.getAttribute("Message").toString();
			out.print(msg);
		}

	%>
	<form action="login" method="post">
	 <div class="container">
	 <h1>Login Form</h1>
	 <p>Please enter credentials.</p>
	 <hr>
		<table>
			<tr>
				<td><label for="userName"><b>User Name</b></label></td>
				<td><input type="text" placeholder="User Name" name="userName"></td>
			</tr>
			<tr>
				<td><label for="password"><b>Password</b></label></td>
				<td><input type="password" placeholder="Password" name="password"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit"  class="registerbtn" name="login" value="Login"></td>
			</tr>
			<tr>
			<td>Create a new user account ? <a href="UserRegister.jsp">Register</a></td>
			</tr>
		</table>
		  </div>
	</form>
</body>
</html>
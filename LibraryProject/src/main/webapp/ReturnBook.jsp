<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import=" java.util.List,com.Entity.BookEntity,java.util.List,com.Entity.UserEntity"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Return Book</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body {
  font-family: Arial, Helvetica, sans-serif;
}

.navbar {
  overflow: hidden;
  background-color: #000080;
}

.navbar a {
  float: left;
  font-size: 16px;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

.dropdown {
  float: left;
  overflow: hidden;
}

.dropdown .dropbtn {
  font-size: 16px;  
  border: none;
  outline: none;
  color: white;
  padding: 14px 16px;
  background-color: #f1f1f1;
  color: #000000;
  font-family: inherit;
  margin: 0;
}

.navbar a:hover, .dropdown:hover .dropbtn {
  background-color: #D3D3D3;
  color: #000000;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 200px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  float: none;
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  text-align: left;
}

.dropdown-content a:hover {
  background-color: #ddd;
}

.dropdown:hover .dropdown-content {
  display: block;
}

ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
}

li {
  float: left;
  border-right:1px solid #bbb;
}

li:last-child {
  border-right: none;
}

body {
  font-family: Arial, Helvetica, sans-serif;

}

* {
  box-sizing: border-box;
}

/* Add padding to containers */
.container {
  padding: 16px;
  background-color: white;
  margin-left: 400px;
  margin-top:20px;
}

/* Full-width input fields */
input[type=text], input[type=password] {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
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

/* drop down */



</style>
<script type="text/javascript">
function validate(){

	var bookId = document.getElementById("bookId").value;
	
	if (bookId=="")
	{
		document.getElementById("bookIdError").innerHTML="Please select a book...";
		document.getElementById("bookId").focus();
		validationError=true;
	}
	else 
	{	
		document.getElementById("bookIdError").innerHTML="";			
	}
	
	if(validationError)
		return false;
	return true;
	
}
</script>
</head>
<body>

<div class="navbar">
<ul>
  <li><a href="Home.jsp"><b>Home</b></a></li>
  <%
  	if(session.getAttribute("admin")!=null)
 	{
  %>
    <li><a href="AddBook.jsp"><b>Add Book</b></a></li>
  <%} %>
 

  <li><a href="BookList"><b>Book List</b></a></li>
    <%
  	if(session.getAttribute("admin")!=null)
 	{
  %>
  <li><a href="IssueBook"><b>Issue Book</b></a></li>
  <li><a href="#"><b>Return Book</b></a></li>
  <%} %>
  <li style="float:right"><a href= "logout"><b>Logout</b></a></li>
  </ul>
</div>
<%
if(session.getAttribute("validUser")==null){
	request.setAttribute("Message", "Please login");
	RequestDispatcher rd=request.getRequestDispatcher("Login.jsp");
	rd.forward(request, response);
}
else if(session.getAttribute("admin")==null){
	RequestDispatcher rd=request.getRequestDispatcher("Home.jsp");
	rd.forward(request, response);
}
	
if(request.getAttribute("Message")!=null){
	String msg=request.getAttribute("Message").toString();
	out.print(msg);
}


%>
	<form action="ReturnBook" onsubmit="return validate();" method="post">
	<div class="container">
		<table>
			<tr>
				<td> <label for="bookId"><b>Book Name</b></label></td>
				<td>
					<div class="dropdown">
							<%
							List<BookEntity> books = (List<BookEntity>) request.getAttribute("booklist");
							%>
							<select class="dropbtn" id="bookId" name="bookId">
							<div class="dropdown-content">
							<option value="">Select</option>
								<%
								for (BookEntity book : books) {
								%>
									
										<option value="<%=book.getBookId()%>"><%=book.getBookname()%></option>
									
								<%
								}
								%>
								</div>
							</select>

						</div>
					</td>
				<td><span style="color:red" id="bookIdError">*</span></td>
			</tr>
			
			<tr>
				<td> <label for="issueDescription"><b>Description</b></label></td>
				<td><textarea type="text" name="issueDescription" id="issueDescription" rows="4" cols="50">
				</textarea>			
				</td>
			</tr>
			
			<tr>
				<td colspan="2"><input type="submit" class="registerbtn" name="Return" value="Return"></td>
			</tr>
		</table>
		</div>
	</form>

</body>
</html>
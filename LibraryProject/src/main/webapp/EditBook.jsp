<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="com.Entity.BookEntity"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Book</title>
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
  background-color: inherit;
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
  min-width: 160px;
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

</style>
<script type="text/javascript">
function validate(){
	var bookName = document.getElementById("bookName").value;
	var author = document.getElementById("author").value;
	var language = document.getElementById("language").value;
	var publishYear = document.getElementById("publishYear").value;
	
	var validationError=false;
	var nameRegex=/^[a-zA-Z ]+$/;		
	var yearRegex=/^[0-9]{4}$/;
	
	if (bookName=="")
		{
			document.getElementById("bookNameError").innerHTML="Please enter book name...";
			document.getElementById("bookName").focus();
			validationError=true;
		}	

	else 
		{
			document.getElementById("bookNameError").innerHTML="";	
			
		}		
if (author=="")
		{
			document.getElementById("authorError").innerHTML="Please enter author name...";
			document.getElementById("author").focus();
			validationError=true;
		}
	
	else if(nameRegex.test(author))
	{
		document.getElementById("authorError").innerHTML="";	
		
	}

	else
	{
		document.getElementById("authorError").innerHTML="Enter valid author name...";
		document.getElementById("author").focus();
		validationError=true;
	}


	if (language=="")
	{
		document.getElementById("languageError").innerHTML="Please enter language...";
		document.getElementById("language").focus();
		validationError=true;
	}
	
	else if(nameRegex.test(language))
	{
		document.getElementById("languageError").innerHTML="";	
		
	}

	else
	{
		document.getElementById("languageError").innerHTML="Please enter correct language...";
		document.getElementById("language").focus();
		validationError=true;
	}

	
	if (publishYear=="")
	{
		document.getElementById("publishYearError").innerHTML="Please enter published Year...";
		document.getElementById("publishYear").focus();
		validationError=true;
	}
	else if(yearRegex.test(publishYear))
	{
		document.getElementById("publishYearError").innerHTML="";			
	}
	else
	{
		document.getElementById("publishYearError").innerHTML="Please enter valid published year...";
		document.getElementById("publishYear").focus();
		validationError=true;
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
		<li><a href="Home.jsp"><b>Home</b></a> </li>
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
  <li><a href="ReturnBook"><b>Return Book</b></a></li>
  <%} %>
		<li style="float:right"><a href="logout"><b>Logout</b></a></li>
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
	<form action="EditBook" onsubmit="return validate();" method="post">
	<div class="container">
			<%
				String bId=String.valueOf(((BookEntity)request.getAttribute("book")).getBookId());
				String bName=((BookEntity)request.getAttribute("book")).getBookname();
				String bAuthor=((BookEntity)request.getAttribute("book")).getAuthor();
				String blanguage=((BookEntity)request.getAttribute("book")).getLanguage();
				String bPublishedYear=String.valueOf(((BookEntity)request.getAttribute("book")).getPublishedYear());						
			%>
		<table>
			<tr>
				<td> <label for="bookName"><b>Book Name</b></label></td>
				<td>
				<input type="hidden" value="<%=bId %>" name="bookId">
				<input type="text" value="<%=bName %>" name="bookName" id="bookName">
				</td>
				<td><span style="color:red" id="bookNameError">*</span></td>
			</tr>
			<tr>
				<td> <label for="author"><b>Author</b></label></td>
				<td><input type="text" value="<%=bAuthor %>" name="author" id="author"></td>
				<td><span style="color:red" id="authorError">*</span></td>
			</tr>
			<tr>
			<tr>
				<td> <label for="language"><b>Language</b></label></td>
				<td><input type="text" value="<%=blanguage %>" name="language" id="language"></td>
				<td><span style="color:red" id="languageError">*</span></td>
			</tr>
			<tr>
				<td> <label for="publishYear"><b>Publish Year</b></label></td>
				<td><input type="text" value="<%=bPublishedYear %>" name="publishYear" id="publishYear"></td>
				<td><span style="color:red" id="publishYearError">*</span></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" class="registerbtn" name="Update" value="Update"></td>
			</tr>
		</table>
		</div>
	</form>
</body>
</html>
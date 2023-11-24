<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
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

</style>
</head>
<body>

<div class="navbar">
<ul>
  <li><a href="#home"><b>Home</b></a></li>
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
<!--   <div class="dropdown">
    <button class="dropbtn">Dropdown 
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="#">Link 1</a>
      <a href="#">Link 2</a>
      <a href="#">Link 3</a>
    </div>
  </div> -->
  
 

</div>

  <div class="container">
	 <h1>Welcome to Library</h1>
	 </div>
<%
	if(session.getAttribute("validUser")==null){
		request.setAttribute("Message", "Please login");
		RequestDispatcher rd=request.getRequestDispatcher("Login.jsp");
		rd.forward(request, response);
	}

%>


</body>
</html>
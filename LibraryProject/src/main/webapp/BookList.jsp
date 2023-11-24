<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import=" java.util.List,com.Entity.BookEntity"
	pageEncoding="ISO-8859-1"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Book List</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
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

a{
display: block;
text-align: center;
}

.dropdown-content a:hover {
	background-color: #ddd;
}

.dropdown:hover .dropdown-content {
	display: block;
}

#booksTable {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 90%;
  margin-left:50px;
  font-size: 15px;
}

#booksTable td, #booksTable th {
  border: 1px solid #ddd;
  padding: 4px;
}

#booksTable tr:nth-child(even){background-color: #f2f2f2;}

#booksTable tr:hover {background-color: #ddd;}

#booksTable th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #000080;
  color: white;
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
<script type="text/javascript">

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
  <li><a href="ReturnBook"><b>Return Book</b></a></li>
  <%} %>
		<li style="float:right"><a href="logout"><b>Logout</b></a></li>
		</ul>
	</div>
	<br>
	<br>
	<%
if(session.getAttribute("validUser")==null){
	request.setAttribute("Message", "Please login");
	RequestDispatcher rd=request.getRequestDispatcher("Login.jsp");
	rd.forward(request, response);
}
	
if(request.getAttribute("Message")!=null){
	String msg=request.getAttribute("Message").toString();
	out.print(msg);

}

%>
	<table id="booksTable">
		<thead>
			<tr>
				<th>ID</th>
				<th>Book Name</th>
				<th>Author</th>
				<th>Language</th>
				<th>Published Year</th>
				 <%
  	if(session.getAttribute("admin")!=null)
 	{
  %>
				<th>Actions</th>
				<%} %>

			</tr>
		</thead>
		<tbody>

			<%
			
			 List<BookEntity> books=(List<BookEntity>)request.getAttribute("booklist");
			for (BookEntity book: books){
				%>
				<tr>
					<td><%=book.getBookId() %></td>
					<td><%=book.getBookname() %></td>
					<td><%=book.getAuthor() %></td>
					<td><%=book.getLanguage() %></td>
					<td><%=book.getPublishedYear() %></td>
									 <%
  	if(session.getAttribute("admin")!=null)
 	{
  %>
					<td>
						<a href="EditBook?bookId=<%=book.getBookId() %>">Edit</a>
						<a href="DeleteBook?bookId=<%=book.getBookId() %>" onclick="return confirm('Are you sure?')">Delete</a>
					</td>
					<%} %>
				</tr>
			<%}%>
			
			
		</tbody> 
	</table>


</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Error</title>
</head>
<body>
	<%
		if(request.getAttribute("Message")!=null){
			String msg=request.getAttribute("Message").toString();
			out.print(msg);
		}

	%>
</body>
</html>
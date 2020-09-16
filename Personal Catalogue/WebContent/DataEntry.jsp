<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@page import="login.insert"%>

<% insert d = new insert();
     if(d.i==1){
    	 %> <script>alert("LAST ENTRY WAS INVALID !!");</Script>
    	 <%
     }
%>
<% 
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
response.setHeader("Pragma","no-cache");//http1.0
response.setHeader("Expires","0"); //proxy
if(session.getAttribute("username")==null)response.sendRedirect("index.jsp");

%>
<input type="button" value="All Entries" onclick="window.open('Welcome.jsp','_self')" />
</button>
<p>Data Entry</p>


<form action="Logout" method="post">
<input type="submit" value="Logout">
</form>

<form action="insert" method="post">
<table align="center">
<tr>
<td>Book Name:</td><td><input type="text" name="bookName" autofocus></td></tr>
<td>Author Name:</td><td><input type="text" name="authorName"></td></tr>
<td>Code:</td><td><input type="text" name="code"></td></tr>
<td>Book Number:</td><td><input type="text" name="bNo" required></td></tr>
<td></td><td><input type="submit"  value="Add"></td></tr>
</table>
</body>
</html>






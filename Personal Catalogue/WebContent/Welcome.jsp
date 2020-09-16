<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


<title>Insert title here</title>
</head>
<body style="background-color: #5A65FC;">
<% 
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate"); //http1.1
response.setHeader("Pragma","no-cache");//http1.0
response.setHeader("Expires","0"); //proxy
if(session.getAttribute("username")==null)response.sendRedirect("index.jsp");

%>
<H2>Welcome ${username} </H2><br><br>
<!-- <button onclick="DataEntry.jsp">Enter Data</button> -->
<input type="button" value="Enter Data" onclick="window.open('DataEntry.jsp','_self')" />
<button><a href="#" data-toggle="modal" data-target="#myModal1">Delete Data</a> </button><br>

<div class="modal fade" id="myModal1" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content CUSTOMER details-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">DELETE ENTRY</h4>
        </div>
        <div class="modal-body">
         <form action="DeleteEntry" method="post">
    <table align='center'>
        <tr><td>ENTER BOOK NO.</td><td><input id="m" type="text" name="bookno"></td></tr>
    <tr><td>ENTER BOOK NAME</td><td><input id="cycle" type="text" name="bookname"></td></tr>
                
       
       
        
        <tr><td></td><td><button class="btn  btn-primary" type="submit">DELETE</button>
            <button class="btn btn-primary" data-dismiss="modal">Close</button></td></tr> 
        </table>
            </form>
          
        
      </div>
      
    </div>
    
    <!-- Modal Content Finish --> 
        
             </div> </div>
<br>
<form action="Logout" method="post">
<input type="submit" value="Logout">
</form>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
String id = request.getParameter("userId");
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/anshu";
String dbName = "anshu";
String userId = "root";
String password = "1234";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<h2 align="center"><font><strong>BOOKS LIST</strong></font></h2>

<table align="center" cellpadding="5" cellspacing="5" border="1"  style="background-color: white;">
<tr>

</tr>
<tr >
<td><b>Book Number</b></td>
<td><b>Code</b></td>
<td><b>Book Name</b></td>
<td><b>Author Name</b></td>



</tr>
<%
try{ 
connection = DriverManager.getConnection(connectionUrl, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM booksdb order by bNo";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr bgcolor="#DEB887">


<td><%=resultSet.getString("bno") %></td>
<td><%=resultSet.getString("c") %></td>
<td><%=resultSet.getString("bname") %></td>
<td><%=resultSet.getString("aname") %></td>



</tr>

<% 
}

} catch (Exception e) {
e.printStackTrace();
}
finally{
	statement.close();
	connection.close();
}
%>
</table>
</body>
</html>
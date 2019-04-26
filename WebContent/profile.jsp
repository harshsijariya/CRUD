<%@ page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <jsp:include page="index.html"/>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>
<% HttpSession nsession = request.getSession(false);
String name2=  (String)session.getAttribute("name1");
if(nsession==null||name2==null) {
	out.println("<h2> You Need to login first</h2><br><br>");
	%>
	
	
	<% 
	request.getRequestDispatcher("/login.jsp").include(request, response);
	%>
   
   <%  
}
else{
%>

<%= session.getAttribute("name1") %></h1>

<%
  try {
	String name1=  (String)session.getAttribute("name1");
    java.sql.Connection con;
    Class.forName("oracle.jdbc.driver.OracleDriver");
    con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hr", "harsh");
   // out.println ( "database successfully opened.");
    Statement stmt = con.createStatement();
    String sql;
    sql = "SELECT * from Users where email='"+name1+"'";
    ResultSet rs = stmt.executeQuery(sql);%>
       <table class="table table-hover" border = "1" width = "100%">
     <thead>

   </thead>
    
    
    <% 
  while(rs.next()){%>
 
  <tbody>
  <tr>
  <td ><strong>Name</strong></td>
  
  <td><%=rs.getString(1)%></td>
    <td><form action="update.jsp"><button  type='submit'class='btn btn-success' name="button" value="Full Name"> Edit  </button></form></td>
  
	</tr>
	<tr>
  <td ><strong>Email</strong></td>
  
  <td><%=rs.getString(2)%></td>
    
   <td><form action="update.jsp"><button  type='submit'class='btn btn-success' name="button" value="Email"> Edit  </button></form></td>
	</tr>
	<tr>
  <td ><strong>Mobile Number</strong></td>
  
  <td><%=rs.getString(3)%></td>
     <td><form action="update.jsp"><button  type='submit'class='btn btn-success' name="button" value="Mobile Number"> Edit  </button></form></td>
  
	</tr>
	<tr>
 
  
  
	</tr>
	
	
	
	
	</tbody>
	<%
}%>
</table>
<form action="deleteAccount.jsp"><button  type='submit'class='btn btn-danger' name="button" value="Mobile Number"> Delete Your Account  </button></form>
<%
con.close();
} catch (Exception e) { 
e.printStackTrace();
}}%>
        
    
    

</body>
</html>
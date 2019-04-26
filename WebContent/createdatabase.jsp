<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%><%@ page import="java.sql.*"%><jsp:include page="index.html"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
Connection con = null;
try {
	 Class.forName("oracle.jdbc.driver.OracleDriver");
	    con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hr", "harsh");

Statement statement = con.createStatement();
String query = "    CREATE TABLE users (Name varchar(255),email varchar(255),mobile varchar(255),password varchar(255))";

statement.executeUpdate(query);
out.println("Table users create sucessfully.");
} 
catch (Exception e) 
{
out.println("Table Already Created");
}
%>
</body>
</html>
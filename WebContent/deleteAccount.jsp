<%@ page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%><jsp:include page="index.html"/>
    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
  try {
	String name1=  (String)session.getAttribute("name1");
    java.sql.Connection con;
    Class.forName("oracle.jdbc.driver.OracleDriver");
    con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hr", "harsh");
    out.println ( "database successfully opened.");
    Statement stmt = con.createStatement();
    String email=(String)session.getAttribute("name1");
   String sql="delete from users where email='"+email+"'";
   stmt.executeUpdate(sql);
   session.invalidate();
   
  
        
     %>
     
<%
con.close();
} catch (Exception e) {
e.printStackTrace();
}%>


</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%><%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
try {
    java.sql.Connection con;
    Class.forName("oracle.jdbc.driver.OracleDriver");
    con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hr", "harsh");
    String name=request.getParameter("name");
    String email=request.getParameter("email");
    String mobile=request.getParameter("mobile");
    String pass=request.getParameter("pws");
    String sql="insert Into Users values(?,?,?,?)";
   
    PreparedStatement stmt=con.prepareStatement("insert into Users values(?,?,?,?)");  
         stmt.setString(1,name);
         stmt.setString(2,email);
         stmt.setString(3,mobile);
         stmt.setString(4,pass);
         stmt.executeUpdate();
         
%><%
RequestDispatcher rd=request.getRequestDispatcher("/login.jsp");
rd.forward(request, response);


con.close();
} catch (Exception e) {
e.printStackTrace();
}

%>
</body>
</html>